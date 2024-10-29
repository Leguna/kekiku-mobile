// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      displayName: json['displayName'] as String,
      authMethod: json['authMethod'] as String? ?? 'local',
      email: json['email'] as String,
      phone: json['phone'] as String? ?? '',
      role: json['role'] as String? ?? 'user',
      address: json['address'] as String? ?? '',
      id: json['id'] as String? ?? '',
      photoUrl: json['photoUrl'] as String? ?? '',
      gender: json['gender'] as String? ?? 'lk',
      birthday: json['birthday'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      username: json['username'] ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'authMethod': instance.authMethod,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'address': instance.address,
      'id': instance.id,
      'photoUrl': instance.photoUrl,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'bio': instance.bio,
      'username': instance.username,
    };
