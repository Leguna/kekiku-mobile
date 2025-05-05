import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekiku/cart/data_sources/cart_repository.dart';

import '../../core/index.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial()) {
    getCart();
  }

  Product? selectedProduct;
  List<Product> products = [];
  CartRepository cartRepository = getIt<CartRepository>();

  Future<void> getProductQuantity(Product product) async {
    try {
      emit(const CartState.loading());
      int quantity = await cartRepository.getProductQuantity(product);
      if (quantity == 0) {
        emit(const CartState.empty());
        return;
      }
      emit(CartState.loaded(
        products: products,
        totalPrice: await cartRepository.getTotalPrice(),
        totalQuantity: await cartRepository.getTotalQuantity(),
        selectedProduct: product,
        deliveryFee: await cartRepository.getDeliveryFee(),
        selectedQuantity: quantity,
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> removeFromCart(Product product) async {}

  Future<void> setQuantity(Product product) async {}

  Future<void> checkout() async {}

  Future<void> decrementProductQuantity(Product product) async {
    try {
      emit(CartState.loading(product: product));
      final removedProduct =
          await cartRepository.removeProductFromCart(product);
      products = await cartRepository.fetchCart();
      if (products.isEmpty) {
        emit(const CartState.empty());
        return;
      }
      emit(CartState.loaded(
        products: products,
        totalPrice: await cartRepository.getTotalPrice(),
        totalQuantity: await cartRepository.getTotalQuantity(),
        selectedProduct: removedProduct,
        selectedQuantity: removedProduct.quantity,
        deliveryFee: await cartRepository.getDeliveryFee(),
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> incrementProductQuantity(Product product) async {
    try {
      emit(CartState.loading(product: product));
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

  Future<void> getCart() async {
    try {
      emit(const CartState.loading());
      await Future.delayed(const Duration(seconds: 2));
      products = await cartRepository.fetchCart();
      final totalPrice = await cartRepository.getTotalPrice();
      final totalQuantity = await cartRepository.getTotalQuantity();
      if (products.isEmpty) {
        emit(const CartState.empty());
        return;
      }
      emit(CartState.loaded(
        products: products,
        totalPrice: totalPrice,
        totalQuantity: totalQuantity,
        deliveryFee: await cartRepository.getDeliveryFee(),
        selectedProduct: null,
        selectedQuantity: 0,
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> removeProduct(Product product) async {
    try {
      emit(CartState.loading(product: product));
      cartRepository.removeAllThisProductFromCart(product);
      products.remove(product);
      final totalPrice = await cartRepository.getTotalPrice();
      final totalQuantity = await cartRepository.getTotalQuantity();

      if (products.isEmpty) {
        emit(const CartState.empty());
        return;
      }

      emit(CartState.loaded(
        products: products,
        totalPrice: totalPrice,
        totalQuantity: totalQuantity,
        selectedProduct: null,
        selectedQuantity: 0,
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }
}
