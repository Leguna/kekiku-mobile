import 'package:dio/dio.dart';

class ApiErrorHandler {
 static String getErrorMessage(DioException error) {
    switch (error.type) {
      case DioException.connectionTimeout:
      case DioException.receiveTimeout:
      case DioException.sendTimeout:
        return 'Connection timeout. Please try again later.';

      case DioException.badResponse:
        if (error.response != null) {
          return _handleServerError(error.response!);
        }
        return 'Unexpected error occurred';

      case DioException.requestCancelled:
        return 'Request to the server was cancelled';

      case DioException.connectionError:
        return 'No internet connection. Please check your network and try again.';

      default:
        return 'An unknown error occurred';
    }
  }

  static String _handleServerError(Response response) {
    switch (response.statusCode) {
      case 400:
        return 'Bad request, please check your input';
      case 401:
        return 'Unauthorized, please login again';
      case 403:
        return 'You do not have permission to access this resource';
      case 404:
        return 'Resource not found';
      case 500:
        return 'Server is currently unavailable. Please try again later.';
      default:
        return 'Unexpected server error: ${response.statusCode}';
    }
  }
}