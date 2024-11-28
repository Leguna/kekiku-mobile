import '../../index.dart';

class AuthApiClient extends BaseApiClient {
  AuthApiClient();

  Future<void> setDioAccessToken(String token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<String> login(String username, String password) async {
    return await post('/auth/login', data: {
      'username': username,
      'password': password,
    });
  }

  Future<dynamic> register(String emailOrPhone, String password) async {
    return await post('/auth/register', data: {
      'email': emailOrPhone,
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

  Future<dynamic> loginWithGoogle(String idToken) async {
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

  Future<dynamic> logout() async {
    return await get('/auth/logout');
  }

  Future<dynamic> deleteAccount() async {
    return await delete('/auth/delete');
  }
}
