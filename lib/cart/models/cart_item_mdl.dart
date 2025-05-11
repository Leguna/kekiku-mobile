import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_mdl.freezed.dart';
part 'cart_item_mdl.g.dart';

@freezed
sealed class CartItem with _$CartItem {
  const factory CartItem({
    @Default("") String productId,
    @Default("") String variantId,
    @Default(0) int quantity,
    @Default(0) double basePrice,
    @Default(0) double discountValue,
    @Default("") String productName,
    @Default("") String variantName,
    @Default("") String image,
  }) = _CartItem;

  const CartItem._();

  double get totalPrice =>
      (basePrice - (basePrice * discountValue / 100)) * quantity;

  double get totalBasePrice => basePrice * quantity;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  factory CartItem.fromJsonString(String jsonString) =>
      CartItem.fromJson(json.decode(jsonString) as Map<String, dynamic>);
}
