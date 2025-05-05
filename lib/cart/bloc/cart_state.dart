part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = CartInitial;

  const factory CartState.loading({Product? product}) = CartLoading;

  const factory CartState.error(String message) = _Error;

  const factory CartState.empty() = CartEmpty;

  const factory CartState.checkout() = Checkout;

  const factory CartState.loaded({
    required List<Product> products,
    @Default(0) double totalPrice,
    @Default(0) double totalDiscountedPrice,
    @Default(0) double deliveryFee,
    @Default(0) int totalQuantity,
    required Product? selectedProduct,
    required int? selectedQuantity,
  }) = CartLoaded;
}
