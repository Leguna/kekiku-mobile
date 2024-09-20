
import '../base_api_client.dart';

class AuthApiClient extends BaseApiClient {
  AuthApiClient(super.dio);

  Future<dynamic> login(String username, String password) {
    return post('/auth/login', data: {
      'username': username,
      'password': password,
    });
  }

  Future<dynamic> register(String email, String password) {
    return post('/auth/register', data: {
      'email': email,
      'password': password,
    });
  }

  Future<dynamic> getUserProfile() {
    return get('/auth/profile');
  }

  Future<dynamic> sso(String token) {
    return post('/auth/sso', data: {
      'token': token,
    });
  }
}
