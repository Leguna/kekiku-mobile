// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_mdl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartMdl _$CartMdlFromJson(Map<String, dynamic> json) => _CartMdl(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CartMdlToJson(_CartMdl instance) => <String, dynamic>{
      'products': instance.products,
      'runtimeType': instance.$type,
    };

_Empty _$EmptyFromJson(Map<String, dynamic> json) => _Empty(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EmptyToJson(_Empty instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };
