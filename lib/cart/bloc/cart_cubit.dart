import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekiku/cart/data_sources/cart_repository.dart';

import '../../core/index.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  Product? selectedProduct;
  List<Product> products = [];
  CartRepository cartRepository = getIt<CartRepository>();

  getProductQuantity(Product product) async {
    try {
      emit(const CartState.loading());
      int quantity = await cartRepository.getProductQuantity(product);
      emit(CartLoaded(
        products: products,
        totalPrice: await cartRepository.getTotalPrice(),
        totalQuantity: await cartRepository.getTotalQuantity(),
        selectedProduct: product,
        selectedQuantity: quantity,
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  removeFromCart(Product product) async {}

  setQuantity(Product product) async {}

  clearCart() async {}

  checkout() async {}

  Future<void> decrementProductQuantity(Product product) async {
    try {
      emit(const CartState.loading());
      final removedProduct =
          await cartRepository.removeProductFromCart(product);
      final totalPrice = await cartRepository.getTotalPrice();
      final totalQuantity = await cartRepository.getTotalQuantity();
      products = await cartRepository.fetchCart();
      emit(CartState.loaded(
        products: products,
        totalPrice: totalPrice,
        totalQuantity: totalQuantity,
        selectedProduct: removedProduct,
        selectedQuantity: removedProduct.quantity,
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> incrementProductQuantity(Product product) async {
    try {
      emit(const CartState.loading());
      final addedProduct = await cartRepository.addProductToCart(product);
      final totalPrice = await cartRepository.getTotalPrice();
      final totalQuantity = await cartRepository.getTotalQuantity();
      products = await cartRepository.fetchCart();
      emit(CartState.loaded(
        products: products,
        totalPrice: totalPrice,
        totalQuantity: totalQuantity,
        selectedProduct: addedProduct,
        selectedQuantity: addedProduct.quantity,
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }
}
