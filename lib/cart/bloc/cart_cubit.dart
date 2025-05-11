import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekiku/cart/data_sources/cart_repository.dart';

import '../../core/index.dart';
import '../models/cart_item_mdl.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial()) {
    getCart();
  }

  List<CartItem> cartItems = [];
  CartRepository cartRepository = getIt<CartRepository>();

  Future<void> getCart() async {
    try {
      emit(const CartState.loading());
      await Future.delayed(const Duration(seconds: 1));
      final cartResponse = await cartRepository.fetchCart();
      cartItems = cartResponse.data.items;
      if (cartItems.isEmpty) {
        emit(const CartState.empty());
        return;
      }
      emit(CartState.loaded(
        products: cartItems,
        totalPrice: await cartRepository.getTotalPrice(),
        totalQuantity: await cartRepository.getTotalQuantity(),
        deliveryFee: await cartRepository.getDeliveryFee(),
        selectedProduct: null,
        selectedQuantity: 0,
        totalDiscountedPrice: await cartRepository.getTotalDiscountedPrice(),
        totalBasePrice: await cartRepository.totalBasePrice(),
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> changeSelectedVariant(String variantId) async {
    try {
      emit(const CartState.loading());
      emit(CartState.loaded(
        products: cartItems,
        totalPrice: await cartRepository.getTotalPrice(),
        totalQuantity: await cartRepository.getTotalQuantity(),
        deliveryFee: await cartRepository.getDeliveryFee(),
        selectedQuantity: await cartRepository.getVariantQuantity(variantId),
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> getCartItemQuantity(String variantId) async {
    try {
      emit(const CartState.loading());
      int quantity = await cartRepository.getVariantQuantity(variantId);
      if (quantity == 0) {
        emit(const CartState.empty());
        return;
      }
      emit(CartState.loaded(
        products: cartItems,
        totalPrice: await cartRepository.getTotalPrice(),
        totalQuantity: await cartRepository.getTotalQuantity(),
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

  Future<void> decrementProductQuantity(String variantId) async {
    try {
      emit(CartState.loading());
      final removedProduct =
          await cartRepository.removeProductFromCart(variantId);
      final cartResponse = await cartRepository.fetchCart();
      cartItems = cartResponse.data.items;
      if (cartItems.isEmpty) {
        emit(const CartState.empty());
        return;
      }
      emit(CartState.loaded(
        products: cartItems,
        totalPrice: await cartRepository.getTotalPrice(),
        totalQuantity: await cartRepository.getTotalQuantity(),
        selectedProduct: removedProduct,
        selectedQuantity: removedProduct.quantity,
        deliveryFee: await cartRepository.getDeliveryFee(),
        totalDiscountedPrice: await cartRepository.getTotalDiscountedPrice(),
        totalBasePrice: await cartRepository.totalBasePrice(),
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> incrementProductQuantity(String variantId) async {
    try {
      emit(CartState.loading());
      final addedProduct = await cartRepository.addProductToCart(variantId);
      final totalPrice = await cartRepository.getTotalPrice();
      final totalQuantity = await cartRepository.getTotalQuantity();
      final cartResponse = await cartRepository.fetchCart();
      cartItems = cartResponse.data.items;
      emit(CartState.loaded(
        products: cartItems,
        totalPrice: totalPrice,
        totalQuantity: totalQuantity,
        selectedProduct: addedProduct,
        selectedQuantity: addedProduct.quantity,
        deliveryFee: await cartRepository.getDeliveryFee(),
        totalDiscountedPrice: await cartRepository.getTotalDiscountedPrice(),
        totalBasePrice: await cartRepository.totalBasePrice(),
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> removeProduct(String variantId) async {
    try {
      emit(CartState.loading());
      await cartRepository.removeAllThisProductFromCart(variantId);
      final cartResponse = await cartRepository.fetchCart();
      cartItems = cartResponse.data.items;
      final totalPrice = await cartRepository.getTotalPrice();
      final totalQuantity = await cartRepository.getTotalQuantity();

      if (cartItems.isEmpty) {
        emit(const CartState.empty());
        return;
      }

      emit(CartState.loaded(
        products: cartItems,
        totalPrice: totalPrice,
        totalQuantity: totalQuantity,
        selectedProduct: null,
        selectedQuantity: 0,
        totalBasePrice: await cartRepository.totalBasePrice(),
        totalDiscountedPrice: await cartRepository.getTotalDiscountedPrice(),
        deliveryFee: await cartRepository.getDeliveryFee(),
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }
}
