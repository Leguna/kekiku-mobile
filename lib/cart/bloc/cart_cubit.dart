import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekiku/cart/data_sources/cart_repository.dart';
import 'package:kekiku/cart/models/cart_response.dart';

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
        totalPrice: cartResponse.data.totalPrice,
        totalQuantity: cartResponse.data.totalItem,
        deliveryFee: cartResponse.data.deliveryFee,
        totalDiscountedPrice: cartResponse.data.totalDiscountedPrice,
        totalBasePrice: cartResponse.data.basePrice,
        selectedProduct: null,
        selectedQuantity: 0,
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> changeSelectedVariant(String variantId) async {
    try {
      emit(const CartState.loading());
      final cartResponse = await cartRepository.fetchCart();
      emit(CartState.loaded(
        products: cartItems,
        totalPrice: cartResponse.data.totalPrice,
        totalQuantity: cartResponse.data.totalItem,
        deliveryFee: cartResponse.data.deliveryFee,
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
      final cartResponse = await cartRepository.fetchCart();
      if (quantity == 0) {
        emit(const CartState.empty());
        return;
      }
      emit(CartState.loaded(
        products: cartItems,
        totalPrice: cartResponse.data.totalPrice,
        totalQuantity: cartResponse.data.totalItem,
        deliveryFee: cartResponse.data.deliveryFee,
        totalDiscountedPrice: cartResponse.data.totalDiscountedPrice,
        totalBasePrice: cartResponse.data.basePrice,
        selectedQuantity: quantity,
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> removeFromCart(Product product) async {}

  Future<void> setQuantity(Product product) async {}

  Future<void> checkout() async {
    try {
      emit(const CartState.loading(isFull: true));
      await Future.delayed(const Duration(seconds: 1));
      await cartRepository.checkout();
      emit(CartState.checkout());
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

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
        totalPrice: cartResponse.data.totalPrice,
        totalQuantity: cartResponse.data.totalItem,
        deliveryFee: cartResponse.data.deliveryFee,
        totalDiscountedPrice: cartResponse.data.totalDiscountedPrice,
        totalBasePrice: cartResponse.data.basePrice,
        selectedProduct: removedProduct,
        selectedQuantity: removedProduct.quantity,
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> incrementProductQuantity(String variantId) async {
    try {
      emit(CartState.loading());
      final addedProduct = await cartRepository.addProductToCart(variantId);
      final cartResponse = await cartRepository.fetchCart();
      cartItems = cartResponse.data.items;
      emit(CartState.loaded(
        products: cartItems,
        totalPrice: cartResponse.data.totalPrice,
        totalQuantity: cartResponse.data.totalItem,
        deliveryFee: cartResponse.data.deliveryFee,
        totalDiscountedPrice: cartResponse.data.totalDiscountedPrice,
        totalBasePrice: cartResponse.data.basePrice,
        selectedProduct: addedProduct,
        selectedQuantity: addedProduct.quantity,
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

      if (cartItems.isEmpty) {
        emit(const CartState.empty());
        return;
      }

      emit(CartState.loaded(
        products: cartItems,
        totalPrice: cartResponse.data.totalPrice,
        totalQuantity: cartResponse.data.totalItem,
        deliveryFee: cartResponse.data.deliveryFee,
        totalDiscountedPrice: cartResponse.data.totalDiscountedPrice,
        totalBasePrice: cartResponse.data.basePrice,
        selectedProduct: null,
        selectedQuantity: 0,
      ));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }
}
