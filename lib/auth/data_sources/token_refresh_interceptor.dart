import 'package:dio/dio.dart';
import 'package:kekiku/core/services/google_sso.dart';

import '../../core/index.dart';

class TokenRefreshInterceptor extends Interceptor {
  TokenRefreshInterceptor() : super();
  final SecureStorageManager _tokenManager = SecureStorageManager();
  final Dio dio = getIt<Dio>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final firebase = getIt<GoogleSSOService>();
    final accessToken = await firebase.getIdToken();
    options.headers['Authorization'] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    try {
      final statusCode = response.statusCode;
      if (statusCode != 401) {
        handler.next(response);
        return;
      }
      final requestOptions = response.requestOptions;
      final refreshToken =
          await _tokenManager.readData(SecureStorageManager.refreshTokenKey);

      if (refreshToken == null) {
        throw Exception('Refresh token not found');
      }

      final newAccessToken = await getNewAccessToken(dio);
      requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      final newResponse = await dio.request(
        requestOptions.path,
        options: Options(
          method: requestOptions.method,
          headers: requestOptions.headers,
        ),
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
      );

      handler.resolve(newResponse);
    } catch (e) {
      _tokenManager.deleteAll();
      final firebase = getIt<GoogleSSOService>();
      await firebase.signOut();
      Navigator.of(getIt<GlobalKey<NavigatorState>>().currentContext!)
          .pushNamedAndRemoveUntil(Routes.login, (route) => false);
      handler.reject(DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: e,
      ));
    }
  }

  Future<String> getNewAccessToken(Dio dio) async {
    final refreshToken = await _tokenManager.getRefreshToken();
    final response = await dio.post('/auth/refresh', data: {
      'refreshToken': refreshToken,
    });

    final newAccessToken = response.data['data']['accessToken'];
    final newRefreshToken = response.data['data']['refreshToken'];

    await _tokenManager.setAccessToken(newAccessToken);
    await _tokenManager.setRefreshToken(newRefreshToken);

    return newAccessToken;
  }
}
