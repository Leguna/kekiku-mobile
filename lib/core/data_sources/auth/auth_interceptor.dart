import 'package:dio/dio.dart';

import '../../index.dart';

class AuthInterceptor extends Interceptor {
  late final SecureStorageManager _tokenManager;
  final Dio _dio;

  AuthInterceptor(this._dio) {
    _tokenManager = getIt<SecureStorageManager>();
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _tokenManager.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await _tokenManager.readData(SecureStorageManager.refreshTokenKey);
      if (refreshToken != null) {
        try {
          final newAccessToken = await _refreshToken(refreshToken);
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
      } else {
        handler.reject(err);
      }
    } else {
      handler.reject(err);
    }
  }

  Future<String> _refreshToken(String refreshToken) async {
    final response = await _dio.post(
      'auth/refresh-token',
      data: {'refresh_token': refreshToken},
    );
    return response.data['access_token'];
  }
}
