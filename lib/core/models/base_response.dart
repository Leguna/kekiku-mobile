import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    required bool success,
    @Default(200) int statusCode,
    @Default('') String message,
    required T data,
    @Default([]) List<String> errors,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
}

@freezed
sealed class Result<D, F> with _$Result<D, F> {
  const factory Result.success(D data) = Success<D, F>;

  const factory Result.error(F failure) = Error<D, F>;
}

@freezed
sealed class Failure with _$Failure {
  const factory Failure.unauthenticated({
    @Default(
        "You need to be authenticated to perform this action. Please log in and try again.")
    String description,
  }) = UnauthenticatedError;

  const factory Failure.serverError({
    @Default("We encountered an issue with our server. Please try again later.")
    String description,
  }) = ServerError;
}
