import 'auth_api_client.dart';

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

  Future<dynamic> loginWithGoogle(String? idToken) async {
    try {
      return await _authApiClient.loginWithGoogle(idToken);
    } catch (error) {
      rethrow;
    }
  }
}
