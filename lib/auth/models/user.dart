import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String displayName,
    required String email,
    @Default('') String id,
    @Default('local') String authMethod,
    @Default('') String phone,
    @Default('user') String role,
    @Default('') String address,
    @Default('') String photoUrl,
    @Default('male') String gender,
    @Default('') String birthday,
    @Default('') String bio,
    @Default('') username,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const Map<String, String> genderMap = {
    'male': 'Male',
    'female': 'Female',
    'other': 'Other',
  };

  // Field map
  static const Map<String, String> fieldMap = {
    'displayName': 'Name',
    'username': 'Username',
    'bio': 'Bio',
    'id': 'ID',
    'email': 'Email',
    'phone': 'Phone',
    'photoUrl': 'Photo Profile',
    'address': 'Address',
    'gender': 'Gender',
    'birthday': 'Birthday',
  };
}

User? copyWithField(ProfileField type, String value, User user) {
  switch (type) {
    case ProfileField.displayName:
      return user.copyWith(displayName: value);
    case ProfileField.username:
      return user.copyWith(username: value);
    case ProfileField.bio:
      return user.copyWith(bio: value);
    case ProfileField.id:
      return user.copyWith(id: value);
    case ProfileField.email:
      return user.copyWith(email: value);
    case ProfileField.phone:
      return user.copyWith(phone: value);
    case ProfileField.gender:
      return user.copyWith(gender: value);
    case ProfileField.birthday:
      return user.copyWith(birthday: value);
    case ProfileField.photoUrl:
      return user.copyWith(photoUrl: value);
    case ProfileField.address:
      return user.copyWith(address: value);
  }
}

enum ProfileField {
  displayName,
  username,
  bio,
  id,
  email,
  phone,
  gender,
  birthday,
  photoUrl,
  address,
}

Map<ProfileField, String> editProfileTypeMap = {
  ProfileField.displayName: 'Name',
  ProfileField.username: 'Username',
  ProfileField.bio: 'Bio',
  ProfileField.id: 'ID',
  ProfileField.email: 'Email',
  ProfileField.phone: 'Phone',
  ProfileField.gender: 'Gender',
  ProfileField.birthday: 'Birthday',
};

Map<String, String> genderMap = {
  "male": "Male",
  "female": "Female",
  "other": "Other",
};

String getTypeValue(ProfileField type, User? user) {
  final Map<ProfileField, String?> propertyMapping = {
    ProfileField.displayName: user?.displayName,
    ProfileField.username: user?.username,
    ProfileField.bio: user?.bio,
    ProfileField.id: user?.id,
    ProfileField.email: user?.email,
    ProfileField.phone: user?.phone,
    ProfileField.gender: user?.gender,
    ProfileField.birthday: user?.birthday,
  };
  return propertyMapping[type] ?? '';
}