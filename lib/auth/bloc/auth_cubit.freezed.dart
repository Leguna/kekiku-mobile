// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState()';
  }
}

/// @nodoc
class $AuthStateCopyWith<$Res> {
  $AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}

/// @nodoc

class _Initial implements AuthState {
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
    return 'AuthState.initial()';
  }
}

/// @nodoc

class LoggedOut implements AuthState {
  const LoggedOut();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoggedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.loggedOut()';
  }
}

/// @nodoc

class AuthUserUpdated implements AuthState {
  const AuthUserUpdated(this.user);

  final User? user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthUserUpdatedCopyWith<AuthUserUpdated> get copyWith =>
      _$AuthUserUpdatedCopyWithImpl<AuthUserUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthUserUpdated &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'AuthState.updated(user: $user)';
  }
}

/// @nodoc
abstract mixin class $AuthUserUpdatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthUserUpdatedCopyWith(
          AuthUserUpdated value, $Res Function(AuthUserUpdated) _then) =
      _$AuthUserUpdatedCopyWithImpl;
  @useResult
  $Res call({User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthUserUpdatedCopyWithImpl<$Res>
    implements $AuthUserUpdatedCopyWith<$Res> {
  _$AuthUserUpdatedCopyWithImpl(this._self, this._then);

  final AuthUserUpdated _self;
  final $Res Function(AuthUserUpdated) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = freezed,
  }) {
    return _then(AuthUserUpdated(
      freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class AuthLoading implements AuthState {
  const AuthLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.loading()';
  }
}

/// @nodoc

class FormUpdated implements AuthState {
  const FormUpdated(this.email, this.password, this.valid);

  final dynamic email;
  final dynamic password;
  final dynamic valid;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormUpdatedCopyWith<FormUpdated> get copyWith =>
      _$FormUpdatedCopyWithImpl<FormUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormUpdated &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.valid, valid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(valid));

  @override
  String toString() {
    return 'AuthState.form(email: $email, password: $password, valid: $valid)';
  }
}

/// @nodoc
abstract mixin class $FormUpdatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $FormUpdatedCopyWith(
          FormUpdated value, $Res Function(FormUpdated) _then) =
      _$FormUpdatedCopyWithImpl;
  @useResult
  $Res call({dynamic email, dynamic password, dynamic valid});
}

/// @nodoc
class _$FormUpdatedCopyWithImpl<$Res> implements $FormUpdatedCopyWith<$Res> {
  _$FormUpdatedCopyWithImpl(this._self, this._then);

  final FormUpdated _self;
  final $Res Function(FormUpdated) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? valid = freezed,
  }) {
    return _then(FormUpdated(
      freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as dynamic,
      freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as dynamic,
      freezed == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class AuthChecked implements AuthState {
  const AuthChecked(this.isEmail);

  final dynamic isEmail;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthCheckedCopyWith<AuthChecked> get copyWith =>
      _$AuthCheckedCopyWithImpl<AuthChecked>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthChecked &&
            const DeepCollectionEquality().equals(other.isEmail, isEmail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isEmail));

  @override
  String toString() {
    return 'AuthState.checked(isEmail: $isEmail)';
  }
}

/// @nodoc
abstract mixin class $AuthCheckedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthCheckedCopyWith(
          AuthChecked value, $Res Function(AuthChecked) _then) =
      _$AuthCheckedCopyWithImpl;
  @useResult
  $Res call({dynamic isEmail});
}

/// @nodoc
class _$AuthCheckedCopyWithImpl<$Res> implements $AuthCheckedCopyWith<$Res> {
  _$AuthCheckedCopyWithImpl(this._self, this._then);

  final AuthChecked _self;
  final $Res Function(AuthChecked) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isEmail = freezed,
  }) {
    return _then(AuthChecked(
      freezed == isEmail
          ? _self.isEmail
          : isEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class AuthError implements AuthState {
  const AuthError(this.message);

  final String message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthErrorCopyWith<AuthError> get copyWith =>
      _$AuthErrorCopyWithImpl<AuthError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AuthErrorCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) _then) =
      _$AuthErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AuthErrorCopyWithImpl<$Res> implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._self, this._then);

  final AuthError _self;
  final $Res Function(AuthError) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AuthError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AuthSuccess implements AuthState {
  const AuthSuccess(this.message);

  final String message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthSuccessCopyWith<AuthSuccess> get copyWith =>
      _$AuthSuccessCopyWithImpl<AuthSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AuthState.success(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AuthSuccessCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthSuccessCopyWith(
          AuthSuccess value, $Res Function(AuthSuccess) _then) =
      _$AuthSuccessCopyWithImpl;

  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AuthSuccessCopyWithImpl<$Res> implements $AuthSuccessCopyWith<$Res> {
  _$AuthSuccessCopyWithImpl(this._self, this._then);

  final AuthSuccess _self;
  final $Res Function(AuthSuccess) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AuthSuccess(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Verified implements AuthState {
  const _Verified();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Verified);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.verified()';
  }
}

// dart format on
