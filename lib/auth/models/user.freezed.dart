// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {
  String get displayName;

  String get email;

  String get id;

  String get authMethod;

  String get phone;

  String get role;

  String get address;

  String get photo;

  String get gender;

  String get dateOfBirth;

  String get bio;

  dynamic get username;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authMethod, authMethod) ||
                other.authMethod == authMethod) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      displayName,
      email,
      id,
      authMethod,
      phone,
      role,
      address,
      photo,
      gender,
      dateOfBirth,
      bio,
      const DeepCollectionEquality().hash(username));

  @override
  String toString() {
    return 'User(displayName: $displayName, email: $email, id: $id, authMethod: $authMethod, phone: $phone, role: $role, address: $address, photo: $photo, gender: $gender, dateOfBirth: $dateOfBirth, bio: $bio, username: $username)';
  }
}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) _then) =
      _$UserCopyWithImpl;
  @useResult
  $Res call(
      {String displayName,
      String email,
      String id,
      String authMethod,
      String phone,
      String role,
      String address,
      String photo,
      String gender,
      String dateOfBirth,
      String bio,
      dynamic username});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? email = null,
    Object? id = null,
    Object? authMethod = null,
    Object? phone = null,
    Object? role = null,
    Object? address = null,
    Object? photo = null,
    Object? gender = null,
    Object? dateOfBirth = null,
    Object? bio = null,
    Object? username = freezed,
  }) {
    return _then(_self.copyWith(
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authMethod: null == authMethod
          ? _self.authMethod
          : authMethod // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _User implements User {
  const _User(
      {required this.displayName,
      required this.email,
      this.id = '',
      this.authMethod = 'local',
      this.phone = '',
      this.role = 'user',
      this.address = '',
      this.photo = '',
      this.gender = 'male',
      this.dateOfBirth = '',
      this.bio = '',
      this.username = ''});

  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  final String displayName;
  @override
  final String email;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String authMethod;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String photo;
  @override
  @JsonKey()
  final String gender;
  @override
  @JsonKey()
  final String dateOfBirth;
  @override
  @JsonKey()
  final String bio;
  @override
  @JsonKey()
  final dynamic username;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authMethod, authMethod) ||
                other.authMethod == authMethod) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      displayName,
      email,
      id,
      authMethod,
      phone,
      role,
      address,
      photo,
      gender,
      dateOfBirth,
      bio,
      const DeepCollectionEquality().hash(username));

  @override
  String toString() {
    return 'User(displayName: $displayName, email: $email, id: $id, authMethod: $authMethod, phone: $phone, role: $role, address: $address, photo: $photo, gender: $gender, dateOfBirth: $dateOfBirth, bio: $bio, username: $username)';
  }
}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) =
      __$UserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String displayName,
      String email,
      String id,
      String authMethod,
      String phone,
      String role,
      String address,
      String photo,
      String gender,
      String dateOfBirth,
      String bio,
      dynamic username});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? displayName = null,
    Object? email = null,
    Object? id = null,
    Object? authMethod = null,
    Object? phone = null,
    Object? role = null,
    Object? address = null,
    Object? photo = null,
    Object? gender = null,
    Object? dateOfBirth = null,
    Object? bio = null,
    Object? username = freezed,
  }) {
    return _then(_User(
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authMethod: null == authMethod
          ? _self.authMethod
          : authMethod // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
