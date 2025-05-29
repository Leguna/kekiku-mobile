part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = CartInitial;

  const factory CartState.loading({
    Product? product,
    @Default(false) bool isFull,
    @Default(false) bool showSummary,
  }) = CartLoading;

  const factory CartState.error(String message) = CartError;

  const factory CartState.empty() = CartEmpty;

  const factory CartState.checkout() = CartCheckout;

  const factory CartState.loaded({
    required List<CartItem> products,
    CartResponse? cartResponse,
    @Default(0) double totalPrice,
    @Default(0) double totalDiscountedPrice,
    @Default(0) double deliveryFee,
    @Default(0) int totalQuantity,
    CartItem? selectedProduct,
    @Default(0) int selectedQuantity,
    @Default(0) double totalBasePrice,
  }) = CartLoaded;
}
