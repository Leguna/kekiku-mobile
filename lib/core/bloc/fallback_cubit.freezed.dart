// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fallback_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FallbackState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FallbackState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FallbackState()';
  }
}

/// @nodoc
class $FallbackStateCopyWith<$Res> {
  $FallbackStateCopyWith(FallbackState _, $Res Function(FallbackState) __);
}

/// @nodoc

class _Initial implements FallbackState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FallbackState.initial()';
  }
}

/// @nodoc

class FallbackError implements FallbackState {
  const FallbackError({required this.message, required this.code});

  final String message;
  final String code;

  /// Create a copy of FallbackState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FallbackErrorCopyWith<FallbackError> get copyWith =>
      _$FallbackErrorCopyWithImpl<FallbackError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FallbackError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  String toString() {
    return 'FallbackState.error(message: $message, code: $code)';
  }
}

/// @nodoc
abstract mixin class $FallbackErrorCopyWith<$Res>
    implements $FallbackStateCopyWith<$Res> {
  factory $FallbackErrorCopyWith(
          FallbackError value, $Res Function(FallbackError) _then) =
      _$FallbackErrorCopyWithImpl;
  @useResult
  $Res call({String message, String code});
}

/// @nodoc
class _$FallbackErrorCopyWithImpl<$Res>
    implements $FallbackErrorCopyWith<$Res> {
  _$FallbackErrorCopyWithImpl(this._self, this._then);

  final FallbackError _self;
  final $Res Function(FallbackError) _then;

  /// Create a copy of FallbackState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? code = null,
  }) {
    return _then(FallbackError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class MoveToLogin implements FallbackState {
  const MoveToLogin();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MoveToLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FallbackState.moveToLogin()';
  }
}

// dart format on
