// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      displayName: json['displayName'] as String,
      authMethod: json['authMethod'] as String,
      email: json['email'] as String,
      phone: json['phone'],
      role: json['role'] as String,
      address: json['address'],
      id: json['id'] as String,
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
    };
