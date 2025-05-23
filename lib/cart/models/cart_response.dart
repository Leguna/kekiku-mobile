import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_item_mdl.dart';

part 'cart_response.freezed.dart';
part 'cart_response.g.dart';

@freezed
sealed class CartResponse with _$CartResponse {
  const factory CartResponse({
    @Default(0) double basePrice,
    @Default(0) double deliveryFee,
    @Default(0) int totalItem,
    @Default(0) double totalDiscountedPrice,
    @Default(0) double totalPrice,
    @Default([]) List<CartItem> items,
  }) = _CartResponse;

  const CartResponse._();

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}
