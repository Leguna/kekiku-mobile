import 'package:dio/dio.dart';

import 'token_manager.dart';

class AuthInterceptor extends Interceptor {
  late final TokenManager _tokenManager;
  final Dio _dio;

  AuthInterceptor(this._dio) {
    _tokenManager = TokenManager();
  }

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
    if (err.response?.statusCode == 401) {
      final refreshToken = await _tokenManager.getRefreshToken();
      if (refreshToken != null) {
        try {
          final newAccessToken = await _refreshToken(refreshToken);
          await _tokenManager.setAccessToken(newAccessToken);
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
          _tokenManager.clearTokens();
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
    return response
        .data['access_token'];
  }
}
