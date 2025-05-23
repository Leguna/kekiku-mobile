// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartResponse _$CartResponseFromJson(Map<String, dynamic> json) =>
    _CartResponse(
      basePrice: (json['basePrice'] as num?)?.toDouble() ?? 0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0,
      totalItem: (json['totalItem'] as num?)?.toInt() ?? 0,
      totalDiscountedPrice:
          (json['totalDiscountedPrice'] as num?)?.toDouble() ?? 0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CartResponseToJson(_CartResponse instance) =>
    <String, dynamic>{
      'basePrice': instance.basePrice,
      'deliveryFee': instance.deliveryFee,
      'totalItem': instance.totalItem,
      'totalDiscountedPrice': instance.totalDiscountedPrice,
      'totalPrice': instance.totalPrice,
      'items': instance.items,
    };
