// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseResponseImpl<T> _$$BaseResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$BaseResponseImpl<T>(
      success: json['success'] as bool,
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 200,
      message: json['message'] as String? ?? '',
      data: fromJsonT(json['data']),
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BaseResponseImplToJson<T>(
  _$BaseResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': toJsonT(instance.data),
      'errors': instance.errors,
    };

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
