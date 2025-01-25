import 'dart:convert';

import 'package:image_picker/image_picker.dart';

import '../../core/index.dart';
import '../models/user.dart';

class AuthRepository {
  AuthRepository(this._authApiClient);

  final AuthApiClient _authApiClient;
  final SecureStorageManager _ss = getIt<SecureStorageManager>();
  final localDatabase = getIt<LocalDatabase>();

  Future<dynamic> register(String username, String password) async {
    return await _authApiClient.register(username, password);
  }

  Future<bool> logout() async {
    try {
      _ss.deleteData(userKey);
      final response = await _authApiClient.logout();
      response['data']['isSuccess'];
      return true;
    } catch (e) {
      return true;
    }
  }

  Future<bool> checkPhone(String phone) async {
    final response = await _authApiClient.checkPhone(phone);
    bool isExist = response['data']['isExist'];
    return isExist;
  }

  Future<User> loginWithPhone(String phone, String password) async {
    final response = await _authApiClient.loginWithPhone(phone, password);
    final user = User.fromJson(response['data']['user']);
    await setUser(user);
    return response;
  }

  Future<User> loginWithEmail(String email, String password) async {
    final response = await _authApiClient.loginWithEmail(email, password);
    final user = User.fromJson(response['data']['user']);
    await setUser(user);
    return user;
  }

  Future<bool> loginWithGoogleToken(String idToken) async {
    final response = await _authApiClient.loginWithGoogle(idToken);
    await _ss.writeData(
      userKey,
      jsonEncode(response['data']['user']),
    );
    return true;
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

  Future<User?> getUser() async {
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

    await _authApiClient.deleteAccount();
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
    final response = await _authApiClient.requestRegisterEmail(email);
    if (response['success']) {
      return true;
    } else {
      throw Exception(response['message']);
    }
  }

  Future<void> validateVerificationCode(String email, String pin) async {
    await _authApiClient.validateVerificationCode(email, pin);
  }

  Future<User> createProfile({
    required String email,
    required String name,
    required String password,
    required String pin,
  }) async {
    final response = await _authApiClient.createProfile(
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
    final response = await _authApiClient.uploadImage(image);
    final photoUrl = response['data']['photoUrl'];
    return photoUrl;
  }
}
