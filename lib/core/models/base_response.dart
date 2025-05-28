import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    @Default(true) bool success,
    @Default(200) int statusCode,
    @Default('success') String message,
    required T data,
    @Default([]) List<String> errors,
  }) = _BaseResponse<T>;

  const BaseResponse._();

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
}

@freezed
sealed class Result<D, F> with _$Result<D, F> {
  const factory Result.success(D data) = Success<D, F>;

  const factory Result.error(F failure) = Error<D, F>;
}

extension BaseResponseExtensions<T> on BaseResponse<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(String message) failure,
  }) {
    if (this.success) {
      return success(data);
    } else {
      return failure(message);
    }
  }

  Result<T, String> toResult() {
    return success ? Result.success(data) : Result.error(message);
  }
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

  const factory Failure.networkError({
    @Default("Please check your internet connection and try again.")
    String description,
  }) = NetworkError;

  const factory Failure.unknownError({
    @Default("An unknown error occurred. Please try again later.")
    String description,
  }) = UnknownError;

  const factory Failure.validationError({
    @Default(
        "There was a validation error. Please check your input and try again.")
    String description,
  }) = ValidationError;

  const factory Failure.notFoundError({
    @Default("The requested resource was not found.") String description,
  }) = NotFoundError;
}
