// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditProfileState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EditProfileState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'EditProfileState()';
  }
}

/// @nodoc
class $EditProfileStateCopyWith<$Res> {
  $EditProfileStateCopyWith(
      EditProfileState _, $Res Function(EditProfileState) __);
}

/// @nodoc

class _Initial implements EditProfileState {
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
    return 'EditProfileState.initial()';
  }
}

/// @nodoc

class EditProfileLoading implements EditProfileState {
  const EditProfileLoading({this.fullscreen = true});

  @JsonKey()
  final bool fullscreen;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EditProfileLoadingCopyWith<EditProfileLoading> get copyWith =>
      _$EditProfileLoadingCopyWithImpl<EditProfileLoading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EditProfileLoading &&
            (identical(other.fullscreen, fullscreen) ||
                other.fullscreen == fullscreen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullscreen);

  @override
  String toString() {
    return 'EditProfileState.loading(fullscreen: $fullscreen)';
  }
}

/// @nodoc
abstract mixin class $EditProfileLoadingCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory $EditProfileLoadingCopyWith(
          EditProfileLoading value, $Res Function(EditProfileLoading) _then) =
      _$EditProfileLoadingCopyWithImpl;
  @useResult
  $Res call({bool fullscreen});
}

/// @nodoc
class _$EditProfileLoadingCopyWithImpl<$Res>
    implements $EditProfileLoadingCopyWith<$Res> {
  _$EditProfileLoadingCopyWithImpl(this._self, this._then);

  final EditProfileLoading _self;
  final $Res Function(EditProfileLoading) _then;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fullscreen = null,
  }) {
    return _then(EditProfileLoading(
      fullscreen: null == fullscreen
          ? _self.fullscreen
          : fullscreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ProfileError implements EditProfileState {
  const ProfileError(this.message);

  final String message;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileErrorCopyWith<ProfileError> get copyWith =>
      _$ProfileErrorCopyWithImpl<ProfileError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'EditProfileState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ProfileErrorCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory $ProfileErrorCopyWith(
          ProfileError value, $Res Function(ProfileError) _then) =
      _$ProfileErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ProfileErrorCopyWithImpl<$Res> implements $ProfileErrorCopyWith<$Res> {
  _$ProfileErrorCopyWithImpl(this._self, this._then);

  final ProfileError _self;
  final $Res Function(ProfileError) _then;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ProfileError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Success implements EditProfileState {
  const Success(this.user);

  final User user;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'EditProfileState.success(user: $user)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(Success(
      null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class Deleted implements EditProfileState {
  const Deleted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Deleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'EditProfileState.deleted()';
  }
}

/// @nodoc

class Changed implements EditProfileState {
  const Changed(this.type);

  final ProfileField type;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangedCopyWith<Changed> get copyWith =>
      _$ChangedCopyWithImpl<Changed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Changed &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'EditProfileState.changed(type: $type)';
  }
}

/// @nodoc
abstract mixin class $ChangedCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory $ChangedCopyWith(Changed value, $Res Function(Changed) _then) =
      _$ChangedCopyWithImpl;
  @useResult
  $Res call({ProfileField type});
}

/// @nodoc
class _$ChangedCopyWithImpl<$Res> implements $ChangedCopyWith<$Res> {
  _$ChangedCopyWithImpl(this._self, this._then);

  final Changed _self;
  final $Res Function(Changed) _then;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
  }) {
    return _then(Changed(
      null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProfileField,
    ));
  }
}

// dart format on
