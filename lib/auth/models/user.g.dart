// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      id: json['id'] as String? ?? '',
      authMethod: json['authMethod'] as String? ?? 'local',
      phone: json['phone'] as String? ?? '',
      role: json['role'] as String? ?? 'user',
      address: json['address'] as String? ?? '',
      photoUrl: json['photoUrl'] as String? ?? '',
      gender: json['gender'] as String? ?? 'male',
      birthday: json['birthday'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      username: json['username'] ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'id': instance.id,
      'authMethod': instance.authMethod,
      'phone': instance.phone,
      'role': instance.role,
      'address': instance.address,
      'photoUrl': instance.photoUrl,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'bio': instance.bio,
      'username': instance.username,
    };
