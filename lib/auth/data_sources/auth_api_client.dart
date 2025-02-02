import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/index.dart';

class AuthApiClient extends BaseApiClient {
  AuthApiClient();

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
    return await post('/auth/login', data: {
      'email': email,
      'password': password,
    });
  }

  Future<dynamic> logout() async {
    return await get('/auth/logout');
  }

  Future<dynamic> deleteAccount() async {
    return await delete('/auth/delete-account');
  }

  Future<dynamic> requestRegisterEmail(String email) async {
    return await post('/auth/register-email-verification', data: {
      'email': email,
    });
  }

  Future<dynamic> validateVerificationCode(String email, String pin) async {
    return post('/auth/verify-email', data: {
      "email": email,
      "pin": pin,
    });
  }

  Future<dynamic> createProfile({
    required String email,
    required String name,
    required String password,
    required String pin,
  }) async {
    return await post('/auth/create-profile', data: {
      'email': email,
      'fullName': name,
      'password': password,
      'pin': pin,
    });
  }

  Future<dynamic> uploadImage(XFile image) async {
    final formData = FormData.fromMap({
      'photo': await MultipartFile.fromFile(image.path),
    });
    return await post(
      '/auth/profile/image',
      data: formData,
    );
  }

  Future<dynamic> updateProfile(Map<dynamic, dynamic> updatedField) async {
    return await put('/auth/profile', data: updatedField);
  }
}
