// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(User? user) updated,
    required TResult Function() loading,
    required TResult Function(dynamic email, dynamic password, dynamic valid)
        form,
    required TResult Function(dynamic isEmail) checked,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(User? user)? updated,
    TResult? Function()? loading,
    TResult? Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult? Function(dynamic isEmail)? checked,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(User? user)? updated,
    TResult Function()? loading,
    TResult Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult Function(dynamic isEmail)? checked,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Form value) form,
    required TResult Function(_Checked value) checked,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Form value)? form,
    TResult? Function(_Checked value)? checked,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Updated value)? updated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Form value)? form,
    TResult Function(_Checked value)? checked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(User? user) updated,
    required TResult Function() loading,
    required TResult Function(dynamic email, dynamic password, dynamic valid)
        form,
    required TResult Function(dynamic isEmail) checked,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(User? user)? updated,
    TResult? Function()? loading,
    TResult? Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult? Function(dynamic isEmail)? checked,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(User? user)? updated,
    TResult Function()? loading,
    TResult Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult Function(dynamic isEmail)? checked,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Form value) form,
    required TResult Function(_Checked value) checked,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Form value)? form,
    TResult? Function(_Checked value)? checked,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Updated value)? updated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Form value)? form,
    TResult Function(_Checked value)? checked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoggedOutImplCopyWith<$Res> {
  factory _$$LoggedOutImplCopyWith(
          _$LoggedOutImpl value, $Res Function(_$LoggedOutImpl) then) =
      __$$LoggedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggedOutImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoggedOutImpl>
    implements _$$LoggedOutImplCopyWith<$Res> {
  __$$LoggedOutImplCopyWithImpl(
      _$LoggedOutImpl _value, $Res Function(_$LoggedOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoggedOutImpl implements _LoggedOut {
  const _$LoggedOutImpl();

  @override
  String toString() {
    return 'AuthState.loggedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(User? user) updated,
    required TResult Function() loading,
    required TResult Function(dynamic email, dynamic password, dynamic valid)
        form,
    required TResult Function(dynamic isEmail) checked,
    required TResult Function(String message) error,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(User? user)? updated,
    TResult? Function()? loading,
    TResult? Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult? Function(dynamic isEmail)? checked,
    TResult? Function(String message)? error,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(User? user)? updated,
    TResult Function()? loading,
    TResult Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult Function(dynamic isEmail)? checked,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Form value) form,
    required TResult Function(_Checked value) checked,
    required TResult Function(_Error value) error,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Form value)? form,
    TResult? Function(_Checked value)? checked,
    TResult? Function(_Error value)? error,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Updated value)? updated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Form value)? form,
    TResult Function(_Checked value)? checked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOut implements AuthState {
  const factory _LoggedOut() = _$LoggedOutImpl;
}

/// @nodoc
abstract class _$$UpdatedImplCopyWith<$Res> {
  factory _$$UpdatedImplCopyWith(
          _$UpdatedImpl value, $Res Function(_$UpdatedImpl) then) =
      __$$UpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UpdatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UpdatedImpl>
    implements _$$UpdatedImplCopyWith<$Res> {
  __$$UpdatedImplCopyWithImpl(
      _$UpdatedImpl _value, $Res Function(_$UpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$UpdatedImpl(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UpdatedImpl implements _Updated {
  const _$UpdatedImpl(this.user);

  @override
  final User? user;

  @override
  String toString() {
    return 'AuthState.updated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatedImplCopyWith<_$UpdatedImpl> get copyWith =>
      __$$UpdatedImplCopyWithImpl<_$UpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(User? user) updated,
    required TResult Function() loading,
    required TResult Function(dynamic email, dynamic password, dynamic valid)
        form,
    required TResult Function(dynamic isEmail) checked,
    required TResult Function(String message) error,
  }) {
    return updated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(User? user)? updated,
    TResult? Function()? loading,
    TResult? Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult? Function(dynamic isEmail)? checked,
    TResult? Function(String message)? error,
  }) {
    return updated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(User? user)? updated,
    TResult Function()? loading,
    TResult Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult Function(dynamic isEmail)? checked,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Form value) form,
    required TResult Function(_Checked value) checked,
    required TResult Function(_Error value) error,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Form value)? form,
    TResult? Function(_Checked value)? checked,
    TResult? Function(_Error value)? error,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Updated value)? updated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Form value)? form,
    TResult Function(_Checked value)? checked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class _Updated implements AuthState {
  const factory _Updated(final User? user) = _$UpdatedImpl;

  User? get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatedImplCopyWith<_$UpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(User? user) updated,
    required TResult Function() loading,
    required TResult Function(dynamic email, dynamic password, dynamic valid)
        form,
    required TResult Function(dynamic isEmail) checked,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(User? user)? updated,
    TResult? Function()? loading,
    TResult? Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult? Function(dynamic isEmail)? checked,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(User? user)? updated,
    TResult Function()? loading,
    TResult Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult Function(dynamic isEmail)? checked,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Form value) form,
    required TResult Function(_Checked value) checked,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Form value)? form,
    TResult? Function(_Checked value)? checked,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Updated value)? updated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Form value)? form,
    TResult Function(_Checked value)? checked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FormImplCopyWith<$Res> {
  factory _$$FormImplCopyWith(
          _$FormImpl value, $Res Function(_$FormImpl) then) =
      __$$FormImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic email, dynamic password, dynamic valid});
}

/// @nodoc
class __$$FormImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$FormImpl>
    implements _$$FormImplCopyWith<$Res> {
  __$$FormImplCopyWithImpl(_$FormImpl _value, $Res Function(_$FormImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? valid = freezed,
  }) {
    return _then(_$FormImpl(
      freezed == email ? _value.email! : email,
      freezed == password ? _value.password! : password,
      freezed == valid ? _value.valid! : valid,
    ));
  }
}

/// @nodoc

class _$FormImpl implements _Form {
  const _$FormImpl(this.email, this.password, this.valid);

  @override
  final dynamic email;
  @override
  final dynamic password;
  @override
  final dynamic valid;

  @override
  String toString() {
    return 'AuthState.form(email: $email, password: $password, valid: $valid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormImpl &&
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

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormImplCopyWith<_$FormImpl> get copyWith =>
      __$$FormImplCopyWithImpl<_$FormImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(User? user) updated,
    required TResult Function() loading,
    required TResult Function(dynamic email, dynamic password, dynamic valid)
        form,
    required TResult Function(dynamic isEmail) checked,
    required TResult Function(String message) error,
  }) {
    return form(email, password, valid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(User? user)? updated,
    TResult? Function()? loading,
    TResult? Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult? Function(dynamic isEmail)? checked,
    TResult? Function(String message)? error,
  }) {
    return form?.call(email, password, valid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(User? user)? updated,
    TResult Function()? loading,
    TResult Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult Function(dynamic isEmail)? checked,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (form != null) {
      return form(email, password, valid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Form value) form,
    required TResult Function(_Checked value) checked,
    required TResult Function(_Error value) error,
  }) {
    return form(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Form value)? form,
    TResult? Function(_Checked value)? checked,
    TResult? Function(_Error value)? error,
  }) {
    return form?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Updated value)? updated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Form value)? form,
    TResult Function(_Checked value)? checked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (form != null) {
      return form(this);
    }
    return orElse();
  }
}

abstract class _Form implements AuthState {
  const factory _Form(
          final dynamic email, final dynamic password, final dynamic valid) =
      _$FormImpl;

  dynamic get email;
  dynamic get password;
  dynamic get valid;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormImplCopyWith<_$FormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckedImplCopyWith<$Res> {
  factory _$$CheckedImplCopyWith(
          _$CheckedImpl value, $Res Function(_$CheckedImpl) then) =
      __$$CheckedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic isEmail});
}

/// @nodoc
class __$$CheckedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$CheckedImpl>
    implements _$$CheckedImplCopyWith<$Res> {
  __$$CheckedImplCopyWithImpl(
      _$CheckedImpl _value, $Res Function(_$CheckedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmail = freezed,
  }) {
    return _then(_$CheckedImpl(
      freezed == isEmail ? _value.isEmail! : isEmail,
    ));
  }
}

/// @nodoc

class _$CheckedImpl implements _Checked {
  const _$CheckedImpl(this.isEmail);

  @override
  final dynamic isEmail;

  @override
  String toString() {
    return 'AuthState.checked(isEmail: $isEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckedImpl &&
            const DeepCollectionEquality().equals(other.isEmail, isEmail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isEmail));

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckedImplCopyWith<_$CheckedImpl> get copyWith =>
      __$$CheckedImplCopyWithImpl<_$CheckedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(User? user) updated,
    required TResult Function() loading,
    required TResult Function(dynamic email, dynamic password, dynamic valid)
        form,
    required TResult Function(dynamic isEmail) checked,
    required TResult Function(String message) error,
  }) {
    return checked(isEmail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(User? user)? updated,
    TResult? Function()? loading,
    TResult? Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult? Function(dynamic isEmail)? checked,
    TResult? Function(String message)? error,
  }) {
    return checked?.call(isEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(User? user)? updated,
    TResult Function()? loading,
    TResult Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult Function(dynamic isEmail)? checked,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (checked != null) {
      return checked(isEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Form value) form,
    required TResult Function(_Checked value) checked,
    required TResult Function(_Error value) error,
  }) {
    return checked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Form value)? form,
    TResult? Function(_Checked value)? checked,
    TResult? Function(_Error value)? error,
  }) {
    return checked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Updated value)? updated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Form value)? form,
    TResult Function(_Checked value)? checked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (checked != null) {
      return checked(this);
    }
    return orElse();
  }
}

abstract class _Checked implements AuthState {
  const factory _Checked(final dynamic isEmail) = _$CheckedImpl;

  dynamic get isEmail;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckedImplCopyWith<_$CheckedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(User? user) updated,
    required TResult Function() loading,
    required TResult Function(dynamic email, dynamic password, dynamic valid)
        form,
    required TResult Function(dynamic isEmail) checked,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(User? user)? updated,
    TResult? Function()? loading,
    TResult? Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult? Function(dynamic isEmail)? checked,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(User? user)? updated,
    TResult Function()? loading,
    TResult Function(dynamic email, dynamic password, dynamic valid)? form,
    TResult Function(dynamic isEmail)? checked,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Form value) form,
    required TResult Function(_Checked value) checked,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Form value)? form,
    TResult? Function(_Checked value)? checked,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Updated value)? updated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Form value)? form,
    TResult Function(_Checked value)? checked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
