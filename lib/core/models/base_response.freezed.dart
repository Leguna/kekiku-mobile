// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseResponse<T> {
  bool get success;
  int get statusCode;
  String get message;
  T get data;
  List<String> get errors;

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BaseResponseCopyWith<T, BaseResponse<T>> get copyWith =>
      _$BaseResponseCopyWithImpl<T, BaseResponse<T>>(
          this as BaseResponse<T>, _$identity);

  /// Serializes this BaseResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BaseResponse<T> &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      statusCode,
      message,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(errors));

  @override
  String toString() {
    return 'BaseResponse<$T>(success: $success, statusCode: $statusCode, message: $message, data: $data, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $BaseResponseCopyWith<T, $Res> {
  factory $BaseResponseCopyWith(
          BaseResponse<T> value, $Res Function(BaseResponse<T>) _then) =
      _$BaseResponseCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      int statusCode,
      String message,
      T data,
      List<String> errors});
}

/// @nodoc
class _$BaseResponseCopyWithImpl<T, $Res>
    implements $BaseResponseCopyWith<T, $Res> {
  _$BaseResponseCopyWithImpl(this._self, this._then);

  final BaseResponse<T> _self;
  final $Res Function(BaseResponse<T>) _then;

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = freezed,
    Object? errors = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      errors: null == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _BaseResponse<T> extends BaseResponse<T> {
  const _BaseResponse(
      {this.success = true,
      this.statusCode = 200,
      this.message = 'success',
      required this.data,
      final List<String> errors = const []})
      : _errors = errors,
        super._();
  factory _BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final int statusCode;
  @override
  @JsonKey()
  final String message;
  @override
  final T data;
  final List<String> _errors;
  @override
  @JsonKey()
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BaseResponseCopyWith<T, _BaseResponse<T>> get copyWith =>
      __$BaseResponseCopyWithImpl<T, _BaseResponse<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$BaseResponseToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BaseResponse<T> &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      statusCode,
      message,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_errors));

  @override
  String toString() {
    return 'BaseResponse<$T>(success: $success, statusCode: $statusCode, message: $message, data: $data, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$BaseResponseCopyWith<T, $Res>
    implements $BaseResponseCopyWith<T, $Res> {
  factory _$BaseResponseCopyWith(
          _BaseResponse<T> value, $Res Function(_BaseResponse<T>) _then) =
      __$BaseResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      int statusCode,
      String message,
      T data,
      List<String> errors});
}

/// @nodoc
class __$BaseResponseCopyWithImpl<T, $Res>
    implements _$BaseResponseCopyWith<T, $Res> {
  __$BaseResponseCopyWithImpl(this._self, this._then);

  final _BaseResponse<T> _self;
  final $Res Function(_BaseResponse<T>) _then;

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = freezed,
    Object? errors = null,
  }) {
    return _then(_BaseResponse<T>(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$Result<D, F> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Result<D, F>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Result<$D, $F>()';
  }
}

/// @nodoc
class $ResultCopyWith<D, F, $Res> {
  $ResultCopyWith(Result<D, F> _, $Res Function(Result<D, F>) __);
}

/// @nodoc

class Success<D, F> implements Result<D, F> {
  const Success(this.data);

  final D data;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<D, F, Success<D, F>> get copyWith =>
      _$SuccessCopyWithImpl<D, F, Success<D, F>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success<D, F> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'Result<$D, $F>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<D, F, $Res>
    implements $ResultCopyWith<D, F, $Res> {
  factory $SuccessCopyWith(
          Success<D, F> value, $Res Function(Success<D, F>) _then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call({D data});
}

/// @nodoc
class _$SuccessCopyWithImpl<D, F, $Res>
    implements $SuccessCopyWith<D, F, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<D, F> _self;
  final $Res Function(Success<D, F>) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Success<D, F>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as D,
    ));
  }
}

/// @nodoc

class Error<D, F> implements Result<D, F> {
  const Error(this.failure);

  final F failure;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<D, F, Error<D, F>> get copyWith =>
      _$ErrorCopyWithImpl<D, F, Error<D, F>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Error<D, F> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @override
  String toString() {
    return 'Result<$D, $F>.error(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<D, F, $Res>
    implements $ResultCopyWith<D, F, $Res> {
  factory $ErrorCopyWith(Error<D, F> value, $Res Function(Error<D, F>) _then) =
      _$ErrorCopyWithImpl;
  @useResult
  $Res call({F failure});
}

/// @nodoc
class _$ErrorCopyWithImpl<D, F, $Res> implements $ErrorCopyWith<D, F, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<D, F> _self;
  final $Res Function(Error<D, F>) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(Error<D, F>(
      freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as F,
    ));
  }
}

/// @nodoc
mixin _$Failure {
  String get description;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @override
  String toString() {
    return 'Failure(description: $description)';
  }
}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) =
      _$FailureCopyWithImpl;
  @useResult
  $Res call({String description});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UnauthenticatedError implements Failure {
  const UnauthenticatedError(
      {this.description =
          "You need to be authenticated to perform this action. Please log in and try again."});

  @override
  @JsonKey()
  final String description;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnauthenticatedErrorCopyWith<UnauthenticatedError> get copyWith =>
      _$UnauthenticatedErrorCopyWithImpl<UnauthenticatedError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnauthenticatedError &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @override
  String toString() {
    return 'Failure.unauthenticated(description: $description)';
  }
}

/// @nodoc
abstract mixin class $UnauthenticatedErrorCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $UnauthenticatedErrorCopyWith(UnauthenticatedError value,
          $Res Function(UnauthenticatedError) _then) =
      _$UnauthenticatedErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String description});
}

/// @nodoc
class _$UnauthenticatedErrorCopyWithImpl<$Res>
    implements $UnauthenticatedErrorCopyWith<$Res> {
  _$UnauthenticatedErrorCopyWithImpl(this._self, this._then);

  final UnauthenticatedError _self;
  final $Res Function(UnauthenticatedError) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
  }) {
    return _then(UnauthenticatedError(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ServerError implements Failure {
  const ServerError(
      {this.description =
          "We encountered an issue with our server. Please try again later."});

  @override
  @JsonKey()
  final String description;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServerErrorCopyWith<ServerError> get copyWith =>
      _$ServerErrorCopyWithImpl<ServerError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerError &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @override
  String toString() {
    return 'Failure.serverError(description: $description)';
  }
}

/// @nodoc
abstract mixin class $ServerErrorCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) _then) =
      _$ServerErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String description});
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res> implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(this._self, this._then);

  final ServerError _self;
  final $Res Function(ServerError) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
  }) {
    return _then(ServerError(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class NetworkError implements Failure {
  const NetworkError(
      {this.description =
          "Please check your internet connection and try again."});

  @override
  @JsonKey()
  final String description;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NetworkErrorCopyWith<NetworkError> get copyWith =>
      _$NetworkErrorCopyWithImpl<NetworkError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NetworkError &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @override
  String toString() {
    return 'Failure.networkError(description: $description)';
  }
}

/// @nodoc
abstract mixin class $NetworkErrorCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $NetworkErrorCopyWith(
          NetworkError value, $Res Function(NetworkError) _then) =
      _$NetworkErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String description});
}

/// @nodoc
class _$NetworkErrorCopyWithImpl<$Res> implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(this._self, this._then);

  final NetworkError _self;
  final $Res Function(NetworkError) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
  }) {
    return _then(NetworkError(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UnknownError implements Failure {
  const UnknownError(
      {this.description =
          "An unknown error occurred. Please try again later."});

  @override
  @JsonKey()
  final String description;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnknownErrorCopyWith<UnknownError> get copyWith =>
      _$UnknownErrorCopyWithImpl<UnknownError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnknownError &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @override
  String toString() {
    return 'Failure.unknownError(description: $description)';
  }
}

/// @nodoc
abstract mixin class $UnknownErrorCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $UnknownErrorCopyWith(
          UnknownError value, $Res Function(UnknownError) _then) =
      _$UnknownErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String description});
}

/// @nodoc
class _$UnknownErrorCopyWithImpl<$Res> implements $UnknownErrorCopyWith<$Res> {
  _$UnknownErrorCopyWithImpl(this._self, this._then);

  final UnknownError _self;
  final $Res Function(UnknownError) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
  }) {
    return _then(UnknownError(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ValidationError implements Failure {
  const ValidationError(
      {this.description =
          "There was a validation error. Please check your input and try again."});

  @override
  @JsonKey()
  final String description;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValidationErrorCopyWith<ValidationError> get copyWith =>
      _$ValidationErrorCopyWithImpl<ValidationError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValidationError &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @override
  String toString() {
    return 'Failure.validationError(description: $description)';
  }
}

/// @nodoc
abstract mixin class $ValidationErrorCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $ValidationErrorCopyWith(
          ValidationError value, $Res Function(ValidationError) _then) =
      _$ValidationErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String description});
}

/// @nodoc
class _$ValidationErrorCopyWithImpl<$Res>
    implements $ValidationErrorCopyWith<$Res> {
  _$ValidationErrorCopyWithImpl(this._self, this._then);

  final ValidationError _self;
  final $Res Function(ValidationError) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
  }) {
    return _then(ValidationError(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class NotFoundError implements Failure {
  const NotFoundError(
      {this.description = "The requested resource was not found."});

  @override
  @JsonKey()
  final String description;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotFoundErrorCopyWith<NotFoundError> get copyWith =>
      _$NotFoundErrorCopyWithImpl<NotFoundError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotFoundError &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @override
  String toString() {
    return 'Failure.notFoundError(description: $description)';
  }
}

/// @nodoc
abstract mixin class $NotFoundErrorCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $NotFoundErrorCopyWith(
          NotFoundError value, $Res Function(NotFoundError) _then) =
      _$NotFoundErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String description});
}

/// @nodoc
class _$NotFoundErrorCopyWithImpl<$Res>
    implements $NotFoundErrorCopyWith<$Res> {
  _$NotFoundErrorCopyWithImpl(this._self, this._then);

  final NotFoundError _self;
  final $Res Function(NotFoundError) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
  }) {
    return _then(NotFoundError(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
