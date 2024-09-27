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
}
