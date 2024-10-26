import 'package:dio/dio.dart';
import 'package:kekiku/core/index.dart';

import '../../../auth/models/user.dart';

class AuthRepository {
  final AuthApiClient _authApiClient;

  AuthRepository(this._authApiClient);

  Future<dynamic> login(String username, String password) async {
    return await _authApiClient.login(username, password);
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
    getIt<Dio>().options.headers['Authorization'] = 'Bearer $token';
    final user = User.fromJson(response['data']);
    return user;
  }

  checkEmail(String email) {
    return _authApiClient.checkEmail(email);
  }

  checkPhone(String phone) {
    return _authApiClient.checkPhone(phone);
  }
}
