// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_mdl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cart _$CartFromJson(Map<String, dynamic> json) => _Cart(
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
      totalDiscountedPrice:
          (json['totalDiscountedPrice'] as num?)?.toDouble() ?? 0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0,
      totalQuantity: (json['totalQuantity'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CartToJson(_Cart instance) => <String, dynamic>{
      'products': instance.products,
      'totalPrice': instance.totalPrice,
      'totalDiscountedPrice': instance.totalDiscountedPrice,
      'deliveryFee': instance.deliveryFee,
      'totalQuantity': instance.totalQuantity,
    };
