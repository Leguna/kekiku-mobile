import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kekiku/core/index.dart';

import '../../../auth/models/user.dart';

class AuthRepository {
  final AuthApiClient _authApiClient;

  AuthRepository(this._authApiClient);

  setToken(String token) async {
    getIt<Dio>().options.headers['Authorization'] = 'Bearer $token';
    await getIt<SecureStorageManager>().setToken(token);
  }

  Future<dynamic> register(String username, String password) async {
    return await _authApiClient.register(username, password);
  }

  Future<dynamic> logout() async {
    return await _authApiClient.logout();
  }

  Future<User> loginWithGoogle(String? idToken) async {
    final response = await _authApiClient.loginWithGoogle(idToken);
    final token = response['data']['token'];
    setToken(token);
    final user = User.fromJson(response['data']);
    return user;
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
    final token = response['data']['token'];
    setToken(token);
    return response;
  }

  Future<bool> loginWithEmail(String email, String password) async {
    final response = await _authApiClient.loginWithEmail(email, password);
    final token = response['data']['token'];
    setToken(token);
    return response;
  }

  Future<bool> isFingerprintRegistered() async {
    final secureStorageManager = getIt<SecureStorageManager>();
    return await secureStorageManager
            .readData(SecureStorageManager.fingerPrintKey) !=
        null;
  }

  void registerFingerprint(User user) {
    final secureStorageManager = getIt<SecureStorageManager>();
    secureStorageManager.writeData(
      SecureStorageManager.fingerPrintKey,
      jsonEncode(user),
    );
  }

  Future<User?> loginWithFingerprint() async {
    final secureStorageManager = getIt<SecureStorageManager>();
    final userJson = await secureStorageManager.readData(
      SecureStorageManager.fingerPrintKey,
    );
    if (userJson == null) {
      return null;
    }
    final user = User.fromJson(jsonDecode(userJson));
    return user;
  }
}
