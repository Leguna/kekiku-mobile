import 'dart:convert';

import 'package:kekiku/core/index.dart';

import '../../../auth/models/user.dart';

class AuthRepository {
  AuthRepository(this._authApiClient);

  final AuthApiClient _authApiClient;
  final SecureStorageManager _ss = getIt<SecureStorageManager>();

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

  Future<bool> checkEmail(String email) async {
    final response = await _authApiClient.checkEmail(email);
    bool isExist = response['data']['isExist'];
    return isExist;
  }

  Future<bool> checkPhone(String phone) async {
    final response = await _authApiClient.checkPhone(phone);
    bool isExist = response['data']['isExist'];
    return isExist;
  }

  Future<bool> loginWithPhone(String phone, String password) async {
    final response = await _authApiClient.loginWithPhone(phone, password);
    return response;
  }

  Future<bool> loginWithEmail(String email, String password) async {
    final response = await _authApiClient.loginWithEmail(email, password);
    return response;
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
    final secureStorageManager = getIt<SecureStorageManager>();
    final userJson = await secureStorageManager.readData(
      SecureStorageManager.fingerprintKey,
    );
    if (userJson == null) {
      return null;
    }
    final user = User.fromJson(jsonDecode(userJson));
    return user;
  }

  Future<User?> getUser() async {
    final secureStorageManager = getIt<SecureStorageManager>();
    final id = await secureStorageManager.readData(userKey);
    if (id == null) throw Exception(Strings.dataNotFound);
    final userJson = await secureStorageManager.readData(id);
    if (userJson == null) throw Exception(Strings.dataNotFound);
    final user = User.fromJson(jsonDecode(userJson));
    return user;
  }

  Future<void> deleteAccount() async {
    final userId = await _ss.readData(userKey);
    if (userId == null) throw Exception(Strings.dataNotFound);
    await _ss.deleteData(userId);
  }

  Future setUser(User user) async {
    await _ss.writeData(
      user.id,
      jsonEncode(user),
    );
  }
}
