import '../../index.dart';

class AuthApiClient extends BaseApiClient {
  AuthApiClient(super.dio);

  Future<String> login(String username, String password) async {
    return await post('/auth/login', data: {
      'username': username,
      'password': password,
    });
  }

  Future<dynamic> register(String email, String password) async {
    return await post('/auth/register', data: {
      'email': email,
      'password': password,
    });
  }

  Future<dynamic> getUserProfile() async {
    return await get('/auth/profile');
  }

  Future<dynamic> sso(String token) async {
    return await post('/auth/sso', data: {
      'token': token,
    });
  }

  Future<dynamic> logout() async {
    return await get('/auth/logout');
  }

  Future<dynamic> loginWithGoogle(idToken) async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'data': {
        'accessToken': 'accessToken',
        'refreshToken': 'refresh token',
        'user': {
          'id': 1,
          'email': ' email',
          'name': 'name',
          'phone': 'phone',
        }
      }
    };
    return post('/auth/google/mobile', data: {
      'idToken': idToken,
    });
  }

  Future<dynamic> checkEmail(String email) async {
    return await get('/auth/check/email', queryParams: {
      'email': email,
    });
  }

  Future<dynamic> checkPhone(String phone) async {
    return await get('/auth/check/phone', queryParams: {
      'phone': phone,
    });
  }

  Future<dynamic> loginWithPhone(String phone, String password) async {
    return await post('/auth/login/phone', data: {
      'phone': phone,
      'password': password,
    });
  }

  Future<dynamic> loginWithEmail(String email, String password) async {
    return await post('/auth/login/email', data: {
      'email': email,
      'password': password,
    });
  }
}
