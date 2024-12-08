// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PagingResponseImpl<T> _$$PagingResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$PagingResponseImpl<T>(
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$PagingResponseImplToJson<T>(
  _$PagingResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'pageSize': instance.pageSize,
      'totalItems': instance.totalItems,
      'items': instance.items.map(toJsonT).toList(),
    };
