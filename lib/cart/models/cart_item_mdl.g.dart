// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_mdl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
      productId: json['productId'] as String? ?? "",
      variantId: json['variantId'] as String? ?? "",
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      basePrice: (json['basePrice'] as num?)?.toDouble() ?? 0,
      discountValue: (json['discountValue'] as num?)?.toDouble() ?? 0,
      productName: json['productName'] as String? ?? "",
      variantName: json['variantName'] as String? ?? "",
      image: json['image'] as String? ?? "",
    );

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
      'productId': instance.productId,
      'variantId': instance.variantId,
      'quantity': instance.quantity,
      'basePrice': instance.basePrice,
      'discountValue': instance.discountValue,
      'productName': instance.productName,
      'variantName': instance.variantName,
      'image': instance.image,
    };
