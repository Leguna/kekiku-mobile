import '../../index.dart';

class AuthApiClient extends BaseApiClient {
  AuthApiClient(super.dio);

  login(String username, String password) {
    return post('/auth/login', data: {
      'username': username,
      'password': password,
    });
  }

  register(String email, String password) {
    return post('/auth/register', data: {
      'email': email,
      'password': password,
    });
  }

  getUserProfile() {
    return get('/auth/profile');
  }

  sso(String token) {
    return post('/auth/sso', data: {
      'token': token,
    });
  }

  logout() {
    return get('/auth/logout');
  }

  loginWithGoogle(idToken) async {
    return await post('/auth/google/mobile', data: {
      'idToken': idToken,
    });
  }

  checkEmail(String email) {
    return get('/auth/check/email', queryParams: {
      'email': email,
    });
  }

  checkPhone(String phone) {
    return get('/auth/check/phone', queryParams: {
      'phone': phone,
    });
  }
}
