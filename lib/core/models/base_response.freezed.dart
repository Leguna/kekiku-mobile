// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseResponse<T> _$BaseResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _BaseResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$BaseResponse<T> {
  bool get success => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  T get data => throw _privateConstructorUsedError;
  List<Error> get errors => throw _privateConstructorUsedError;

  /// Serializes this BaseResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseResponseCopyWith<T, BaseResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseCopyWith<T, $Res> {
  factory $BaseResponseCopyWith(
          BaseResponse<T> value, $Res Function(BaseResponse<T>) then) =
      _$BaseResponseCopyWithImpl<T, $Res, BaseResponse<T>>;
  @useResult
  $Res call(
      {bool success,
      int statusCode,
      String message,
      T data,
      List<Error> errors});
}

/// @nodoc
class _$BaseResponseCopyWithImpl<T, $Res, $Val extends BaseResponse<T>>
    implements $BaseResponseCopyWith<T, $Res> {
  _$BaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<Error>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseResponseImplCopyWith<T, $Res>
    implements $BaseResponseCopyWith<T, $Res> {
  factory _$$BaseResponseImplCopyWith(_$BaseResponseImpl<T> value,
          $Res Function(_$BaseResponseImpl<T>) then) =
      __$$BaseResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      int statusCode,
      String message,
      T data,
      List<Error> errors});
}

/// @nodoc
class __$$BaseResponseImplCopyWithImpl<T, $Res>
    extends _$BaseResponseCopyWithImpl<T, $Res, _$BaseResponseImpl<T>>
    implements _$$BaseResponseImplCopyWith<T, $Res> {
  __$$BaseResponseImplCopyWithImpl(
      _$BaseResponseImpl<T> _value, $Res Function(_$BaseResponseImpl<T>) _then)
      : super(_value, _then);

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
    return _then(_$BaseResponseImpl<T>(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<Error>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$BaseResponseImpl<T> implements _BaseResponse<T> {
  const _$BaseResponseImpl(
      {required this.success,
      required this.statusCode,
      required this.message,
      required this.data,
      required final List<Error> errors})
      : _errors = errors;

  factory _$BaseResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$BaseResponseImplFromJson(json, fromJsonT);

  @override
  final bool success;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final T data;
  final List<Error> _errors;
  @override
  List<Error> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'BaseResponse<$T>(success: $success, statusCode: $statusCode, message: $message, data: $data, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseResponseImpl<T> &&
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

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseResponseImplCopyWith<T, _$BaseResponseImpl<T>> get copyWith =>
      __$$BaseResponseImplCopyWithImpl<T, _$BaseResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$BaseResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _BaseResponse<T> implements BaseResponse<T> {
  const factory _BaseResponse(
      {required final bool success,
      required final int statusCode,
      required final String message,
      required final T data,
      required final List<Error> errors}) = _$BaseResponseImpl<T>;

  factory _BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$BaseResponseImpl<T>.fromJson;

  @override
  bool get success;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  T get data;
  @override
  List<Error> get errors;

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseResponseImplCopyWith<T, _$BaseResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return _Error.fromJson(json);
}

/// @nodoc
mixin _$Error {
  String get message => throw _privateConstructorUsedError;

  /// Serializes this Error to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res, Error>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res, $Val extends Error>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> implements $ErrorCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ErrorCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  factory _$ErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorImplFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'Error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorImplToJson(
      this,
    );
  }
}

abstract class _Error implements Error {
  const factory _Error({required final String message}) = _$ErrorImpl;

  factory _Error.fromJson(Map<String, dynamic> json) = _$ErrorImpl.fromJson;

  @override
  String get message;

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
