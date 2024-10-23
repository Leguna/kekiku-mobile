import 'package:dio/dio.dart';
import 'package:kekiku/core/index.dart';

import '../../../auth/models/user.dart';

class AuthRepository {
  final AuthApiClient _authApiClient;

  AuthRepository(this._authApiClient);

  Future<dynamic> login(String username, String password) async {
    try {
      return await _authApiClient.login(username, password);
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> register(String username, String password) async {
    try {
      return await _authApiClient.register(username, password);
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> logout() async {
    try {
      return await _authApiClient.logout();
    } catch (error) {
      rethrow;
    }
  }

  Future<User> loginWithGoogle(String? idToken) async {
    try {
      final response = await _authApiClient.loginWithGoogle(idToken);
      final token = response['data']['token'];
      getIt<Dio>().options.headers['Authorization'] = 'Bearer $token';
      final user = User.fromJson(response['data']);
      return user;
    } catch (error) {
      rethrow;
    }
  }
}
