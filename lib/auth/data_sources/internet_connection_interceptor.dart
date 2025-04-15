import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

typedef LogoutCallback = void Function(String message, RequestOptions options);

class CheckInternetInterceptor extends Interceptor {
  final Connectivity _connectivity = Connectivity();
  late final LogoutCallback? onLogout;

  CheckInternetInterceptor({this.onLogout});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.firstOrNull == ConnectivityResult.none) {
      onLogout?.call("No internet connection", options);
      handler.reject(
        DioException(requestOptions: options, error: "No internet connection"),
      );
    }
    try {
      final response = await _connectivity.checkConnectivity();
      if (response.firstOrNull == ConnectivityResult.none) {
        onLogout?.call("No internet connection", options);
        handler.reject(
          DioException(
              requestOptions: options, error: "No internet connection"),
        );
        return;
      }
      super.onRequest(options, handler);
    } catch (e) {
      onLogout?.call("No internet connection", options);
      handler.reject(
        DioException(requestOptions: options, error: "No internet connection"),
      );
    }
  }
}
