part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  const factory CartState.loading() = CartLoading;

  const factory CartState.error(String message) = _Error;

  const factory CartState.empty() = _Empty;

  const factory CartState.checkout() = Checkout;

  const factory CartState.loaded({
    required List<Product> products,
    required double totalPrice,
    required int totalQuantity,
    required Product? selectedProduct,
    required int? selectedQuantity,
  }) = CartLoaded;
}
