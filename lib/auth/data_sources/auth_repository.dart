import 'dart:convert';

import 'package:image_picker/image_picker.dart';

import '../../core/index.dart';
import '../../core/services/google_sso.dart';
import '../models/user.dart';

class AuthRepository {
  AuthRepository(this._ds);

  final AuthApiClient _ds;
  final SecureStorageManager _ss = getIt<SecureStorageManager>();
  final localDatabase = getIt<LocalDatabase>();

  Future<dynamic> register(String username, String password) async {
    return await _ds.register(username, password);
  }

  Future<bool> logout() async {
    try {
      _ss.deleteData(userKey);
      final response = await _ds.logout();
      response['data']['isSuccess'];
      return true;
    } catch (e) {
      return true;
    }
  }

  Future<bool> checkPhone(String phone) async {
    final response = await _ds.checkPhone(phone);
    bool isExist = response['data']['isExist'];
    return isExist;
  }

  Future<User> loginWithPhone(String phone, String password) async {
    final response = await _ds.loginWithPhone(phone, password);
    final user = User.fromJson(response['data']['user']);
    await setUser(user);
    return response;
  }

  Future<User> loginWithEmail(String email, String password) async {
    final response = await _ds.loginWithEmail(email, password);
    final user = User.fromJson(response['data']['user']);
    await _ss.setAccessToken(response['data']['accessToken']);
    await _ss.setRefreshToken(response['data']['refreshToken']);
    await setUser(user);
    return user;
  }

  Future<User> loginWithGoogleToken() async {
    final googleSSOService = getIt<GoogleSSOService>();
    await googleSSOService.signOut();
    await googleSSOService.signIn();
    final idToken = await googleSSOService.getIdToken();
    final accessToken = await googleSSOService.getAccessToken();
    await _ss.setAccessToken(accessToken);
    final response = await _ds.loginWithGoogle(idToken);
    final user = User.fromJson(response['data']['user']);
    await setUser(user);

    return user;
  }

  Future<bool> isFingerprintRegistered() async {
    return await _ss.readData(
          SecureStorageManager.fingerprintKey,
        ) !=
        null;
  }

  void registerFingerprint(User user) {
    _ss.writeData(
      SecureStorageManager.fingerprintKey,
      jsonEncode(user),
    );
  }

  Future<User?> loginWithFingerprint() async {
    final userJson = await _ss.readData(
      SecureStorageManager.fingerprintKey,
    );
    if (userJson == null) {
      return null;
    }
    final user = User.fromJson(jsonDecode(userJson));
    return user;
  }

  Future<User?> getProfile() async {
    final response = await _ds.getUserProfile();
    final user = User.fromJson(response['data']);
    await setUser(user);
    return user;
  }

  Future<User?> getLocalUser() async {
    final id = await _ss.readData(userKey);
    if (id == null) throw Exception(Strings.dataNotFound);
    final userJson = await _ss.readData(id);
    if (userJson == null) throw Exception(Strings.dataNotFound);
    final user = User.fromJson(jsonDecode(userJson));
    return user;
  }

  Future<void> deleteAccount() async {
    final userId = await _ss.readData(userKey);
    if (userId == null) throw Exception(Strings.dataNotFound);

    await _ds.deleteAccount();
    await _ss.deleteData(userId);
  }

  Future setUser(User user) async {
    await _ss.writeData(
      userKey,
      user.id,
    );
    await _ss.writeData(
      user.id,
      jsonEncode(user),
    );
  }

  Future<bool> sendVerificationEmail(String email) async {
    final response = await _ds.requestRegisterEmail(email);
    if (response['success']) {
      return true;
    } else {
      throw Exception(response['message']);
    }
  }

  Future<void> validateVerificationCode(String email, String pin) async {
    await _ds.validateVerificationCode(email, pin);
  }

  Future<User> createProfile({
    required String email,
    required String name,
    required String password,
    required String pin,
  }) async {
    final response = await _ds.createProfile(
      email: email,
      name: name,
      password: password,
      pin: pin,
    );

    final accessToken = response['data']['accessToken'];
    final refreshToken = response['data']['refreshToken'];
    final user = response['data']['user'];

    await _ss.writeData(
      SecureStorageManager.accessTokenKey,
      accessToken,
    );

    await _ss.writeData(
      SecureStorageManager.refreshTokenKey,
      refreshToken,
    );

    await setUser(User.fromJson(user));
    return User.fromJson(user);
  }

  Future<String> uploadImage(XFile image) async {
    final response = await _ds.uploadImage(image);
    final photoUrl = response['data']['photo'];
    return photoUrl;
  }

  Future<User> updateProfile(Map<ProfileField, String> fieldsToUpdate) async {
    var updatedField = {};
    fieldsToUpdate.forEach((field, value) {
      switch (field) {
        case ProfileField.displayName:
          updatedField['displayName'] = value;
          break;
        case ProfileField.username:
          updatedField['username'] = value;
          break;
        case ProfileField.bio:
          updatedField['bio'] = value;
          break;
        case ProfileField.id:
          updatedField['id'] = value;
          break;
        case ProfileField.email:
          updatedField['email'] = value;
          break;
        case ProfileField.phone:
          updatedField['phone'] = value;
          break;
        case ProfileField.gender:
          updatedField['gender'] = value;
          break;
        case ProfileField.dateOfBirth:
          updatedField['dateOfBirth'] = value;
          break;
        case ProfileField.photo:
          updatedField['photo'] = value;
          break;
        case ProfileField.address:
          updatedField['address'] = value;
          break;
      }
    });

    final response = await _ds.updateProfile(updatedField);
    final user = User.fromJson(response['data']);
    await setUser(user);
    return user;
  }

  loginSilently() async {
    final googleSSOService = getIt<GoogleSSOService>();
    await googleSSOService.loginSilently();
    final id = await _ss.readData(userKey);
    if (id == null) throw Exception(Strings.dataNotFound);
    final userJson = await _ss.readData(id);
    if (userJson == null) throw Exception(Strings.dataNotFound);
    final user = User.fromJson(jsonDecode(userJson));
    return user;
  }
}
