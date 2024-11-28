import 'package:dio/dio.dart';

import '../../index.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._dio);

  final SecureStorageManager _tokenManager = SecureStorageManager();
  final Dio _dio;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _tokenManager.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
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
    final response = await _dio.post(
      'auth/refresh-token',
      data: {'refresh_token': refreshToken},
    );
    return response.data['data']['access_token'];
  }
}
