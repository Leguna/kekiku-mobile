import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    required bool success,
    required int statusCode,
    required String message,
    required T data,
    required List<Error> errors,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(Map<String, dynamic> json,
      T Function(Object?) fromJsonT,) =>
      _$BaseResponseFromJson(json, fromJsonT);
}

@freezed
class Error with _$Error {
  const factory Error({
    required String message,
  }) = _Error;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}

class ResponseUtils {
  static BaseResponse<T> fromJson<T>(Map<String, dynamic> json, {
    required T Function(Map<String, dynamic>) fromJsonT,
  }) {
    return BaseResponse<T>.fromJson(
        json, (data) => fromJsonT(data as Map<String, dynamic>));
  }
}
