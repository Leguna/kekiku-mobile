import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import '../index.dart';

class BaseApiClient {
  final localDatabase = getIt<LocalDatabase>();

  static Dio setupDio() {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? dotenv.env['DEV_BASE_URL'] ?? '',
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 8),
      sendTimeout: const Duration(seconds: 8),
      validateStatus: (status) {
        return status != null && status >= 200 && status < 500;
      },
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      },
    );

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

    final flavor = Flavors.getCurrentFlavor;

    if (flavor == FlavorType.dev) {
      dio.interceptors.add(TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printRequestData: true,
          printResponseData: true,
          printResponseMessage: true,
          printErrorData: true,
          printErrorHeaders: true,
          printErrorMessage: true,
        ),
      ));
    }
    dio.interceptors.add(interceptorErrorWrapper);
    return dio;
  }

  static InterceptorsWrapper interceptorErrorWrapper = InterceptorsWrapper(
    onError: (error, handler) {
      try {
        if (error.response?.statusCode.toString().startsWith('5') == true ||
            error.type == DioExceptionType.connectionError) {
          handler.next(
            throw DioException(
              message: error.response?.data['message'] ??
                  Strings.checkYourConnection,
              response: Response(
                requestOptions: error.requestOptions,
                statusCode: error.response?.statusCode ?? 500,
              ),
              requestOptions: RequestOptions(path: ''),
            ),
          );
        }
        if (error.response?.statusCode == 401) {
          handler.next(
            throw DioException(
              message: Strings.unauthorized,
              response: Response(
                requestOptions: error.requestOptions,
                statusCode: error.response?.statusCode ?? 401,
              ),
              requestOptions: RequestOptions(path: ''),
            ),
          );
        }
        if (error.response?.statusCode == 404) {
          handler.next(
            throw DioException(
              message: Strings.dataNotFound,
              response: Response(
                requestOptions: error.requestOptions,
                statusCode: error.response?.statusCode ?? 401,
              ),
              requestOptions: RequestOptions(path: ''),
            ),
          );
        }
        if (error.type == DioExceptionType.connectionTimeout) {
          handler.next(
            throw DioException(
              message: Strings.checkYourConnection,
              response: Response(
                requestOptions: error.requestOptions,
                statusCode: error.response?.statusCode ?? 408,
              ),
              requestOptions: RequestOptions(path: ''),
            ),
          );
        }
        handler.next(
          throw DioException(
            message: Strings.checkYourConnection,
            response: Response(
              requestOptions: error.requestOptions,
              statusCode: error.response?.statusCode ?? 400,
            ),
            requestOptions: RequestOptions(path: ''),
          ),
        );
      } catch (e) {
        if (e is DioException) {
          handler.next(e);
          return;
        }
        handler.next(
          throw DioException(
            message: Strings.checkYourConnection,
            response: Response(
              requestOptions: error.requestOptions,
              statusCode: error.response?.statusCode ?? 400,
            ),
            requestOptions: RequestOptions(path: ''),
          ),
        );
      }
    },
  );

  Dio get client => getIt<Dio>();

  String get apiKey => dotenv.env['API_KEY'] ?? '';

  Future<dynamic> get(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await client.get(endpoint, queryParameters: queryParams);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.getErrorMessage(e);
    }
  }

  Future<dynamic> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await client.post(
        endpoint,
        data: data,
        queryParameters: queryParams,
      );

      if (response.data['success'] == false) {
        throw Failure.serverError(description: response.data['message']);
      }
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.getErrorMessage(e);
    }
  }

  Future<dynamic> put(String endpoint,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    try {
      final response =
          await client.put(endpoint, data: data, queryParameters: queryParams);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.getErrorMessage(e);
    }
  }

  Future<dynamic> delete(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response =
          await client.delete(endpoint, queryParameters: queryParams);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.data['success'] == false) {
      throw Exception(response.data['message']);
    }
    return response.data;
  }
}
