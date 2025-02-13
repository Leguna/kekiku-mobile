// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_mdl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
      'runtimeType': instance.$type,
    };

_$EmptyImpl _$$EmptyImplFromJson(Map<String, dynamic> json) => _$EmptyImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptyImplToJson(_$EmptyImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
