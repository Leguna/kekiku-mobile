import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kekiku/core/configs.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import '../index.dart';

class BaseApiClient {
  late final Dio _dio;
  final localDatabase = getIt<LocalDatabase>();

  BaseApiClient(this._dio, {Interceptor? interceptor}) {
    _dio.options = BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? '',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
        'Connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br, base64',
      },
    );
    _dio.interceptors.add(AuthInterceptor(_dio));
    _dio.interceptors.add(interceptorErrorWrapper);

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

    final flavor = Flavors.getCurrentFlavor;

    if (flavor == FlavorType.dev) {
      _dio.interceptors.add(TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseMessage: true,
          printRequestData: true,
        ),
      ));
    }
    if (interceptor != null) _dio.interceptors.add(interceptor);
    _dio.interceptors.add(interceptorErrorWrapper);
  }

  final InterceptorsWrapper interceptorErrorWrapper = InterceptorsWrapper(
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

  Dio get client => _dio;

  String get apiKey => dotenv.env['API_KEY'] ?? '';

  Future<dynamic> get(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return _handleResponse(response);
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case 401:
          throw DioException(
            message: Strings.unauthorized,
            response: Response(
              requestOptions: e.requestOptions,
              statusCode: e.response?.statusCode ?? 401,
            ),
            requestOptions: RequestOptions(path: ''),
          );
        case 404:
          throw DioException(
            message: Strings.notFound,
            response: Response(
              requestOptions: e.requestOptions,
              statusCode: e.response?.statusCode ?? 404,
            ),
            requestOptions: RequestOptions(path: ''),
          );
        case 408:
          throw DioException(
            message: Strings.checkYourConnection,
            response: Response(
              requestOptions: e.requestOptions,
              statusCode: e.response?.statusCode ?? 408,
            ),
            requestOptions: RequestOptions(path: ''),
          );
      }
      throw ApiErrorHandler.getErrorMessage(e);
    }
  }

  Future<dynamic> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response =
          await _dio.post(endpoint, data: data, queryParameters: queryParams);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.getErrorMessage(e);
    }
  }

  Future<dynamic> put(String endpoint,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    try {
      final response =
          await _dio.put(endpoint, data: data, queryParameters: queryParams);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.getErrorMessage(e);
    }
  }

  Future<dynamic> delete(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response =
          await _dio.delete(endpoint, queryParameters: queryParams);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiErrorHandler.getErrorMessage(e);
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
