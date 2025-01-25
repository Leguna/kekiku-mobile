import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/index.dart';

class TokenRefreshInterceptor extends Interceptor {
  TokenRefreshInterceptor(this._dio);

  final SecureStorageManager _tokenManager = SecureStorageManager();
  final Dio _dio;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final accessToken = await _tokenManager.getAccessToken();
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
      super.onRequest(options, handler);
    } catch (e) {
      handler.reject(DioException(requestOptions: options));
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      if (err.response?.statusCode != 401) {
        handler.reject(err);
        return;
      }

      final refreshToken =
          await _tokenManager.readData(SecureStorageManager.refreshTokenKey);

      if (refreshToken == null) {
        handler.reject(err);
        return;
      }

      final newAccessToken = await getAccessToken(refreshToken);
      await _tokenManager.setToken(newAccessToken);
      final requestOptions = err.requestOptions;
      requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      final response = await _dio.request(
        requestOptions.path,
        options: Options(
          method: requestOptions.method,
          headers: requestOptions.headers,
        ),
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
      );
      handler.resolve(response);
    } catch (e) {
      _tokenManager.deleteData(SecureStorageManager.refreshTokenKey);
      handler.reject(err);
    }
  }

  Future<String> getAccessToken(String refreshToken) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String token = await user.getIdToken() ?? '';
      return token;
    } else {
      throw Exception('You are not logged in');
    }
  }
}
