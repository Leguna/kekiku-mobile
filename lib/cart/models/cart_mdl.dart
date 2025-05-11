import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_item_mdl.dart';

part 'cart_mdl.freezed.dart';
part 'cart_mdl.g.dart';

@freezed
sealed class Cart with _$Cart{
  const factory Cart({
    @Default([]) List<CartItem> products,
    @Default(0) double totalPrice,
    @Default(0) double totalDiscountedPrice,
    @Default(0) double deliveryFee,
    @Default(0) int totalQuantity,
  }) = _Cart;

  const Cart._();

  double get totalBasePrice {
    double totalBasePrice = 0.0;
    for (var product in products) {
      totalBasePrice += product.totalBasePrice;
    }
    return totalBasePrice;
  }

  factory Cart.fromJson(Map<String, dynamic> json) =>
      _$CartFromJson(json);

  factory Cart.fromJsonString(String jsonString) =>
      Cart.fromJson(json.decode(jsonString) as Map<String, dynamic>);
}
