import 'dart:convert';

import 'package:kekiku/cart/models/cart_item_mdl.dart';

import '../../core/index.dart';
import '../../core/models/paging_response.dart';
import '../../product/data_sources/product_local_source.dart';

class CartLocalDatabase {
  final LocalDatabase db = getIt<LocalDatabase>();
  final ProductLocalSource productLocalSource = getIt<ProductLocalSource>();
  final String cartBox = 'cart';

  CartLocalDatabase();

  Future<CartItem> insertProduct(String variantId) async {
    final box = await db.getBox(cartBox);
    final productJson =
        await productLocalSource.getProductByVariantId(variantId);
    final product = Product.fromJsonString(productJson);
    final selectedVariant = product.variants.firstWhere(
      (variant) => variant.id == variantId,
    );
    var cartItem = CartItem(
        basePrice: selectedVariant.price,
        discountValue: product.discount,
        productId: product.id,
        quantity: 1,
        variantId: variantId,
        productName: product.name,
        image: selectedVariant.image ?? "",
        variantName: selectedVariant.name ?? "");

    final productStored = box.get(variantId);
    if (productStored != null) {
      final storedProduct = CartItem.fromJsonString(productStored);
      cartItem = cartItem.copyWith(
        quantity: storedProduct.quantity + 1,
      );
    }
    var cartItemJson = jsonEncode(cartItem.toJson());
    await box.put(variantId, cartItemJson);
    return cartItem;
  }

  Future<CartItem> decrementProductQuantity(String variantId) async {
    final box = await db.getBox(cartBox);
    var updatedProduct = CartItem(
      basePrice: 0,
      discountValue: 0,
      productId: "",
      quantity: 0,
      variantId: "",
    );
    final productStored = box.get(variantId);

    if (productStored != null) {
      final storedProduct = CartItem.fromJsonString(productStored);
      updatedProduct =
          storedProduct.copyWith(quantity: storedProduct.quantity - 1);
    }

    if (updatedProduct.quantity > 0) {
      var cartItemJson = jsonEncode(updatedProduct.toJson());
      await box.put(variantId, cartItemJson);
    } else {
      await box.delete(variantId);
    }
    return updatedProduct;
  }

  Future<bool> updateProductQuantity(Product product, int quantity) async {
    final box = await db.getBox(cartBox);
    final productList = box.get(cartBox) as List<Product>? ?? [];
    final index = productList.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      productList[index] = product.copyWith(quantity: quantity);
      await box.put(cartBox, productList);
      return true;
    }
    return false;
  }

  Future<bool> deleteProduct(String variantId) async {
    try {
      final box = await db.getBox(cartBox);
      await box.delete(variantId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> clearCart() async {
    try {
      final box = await db.getBox(cartBox);
      await box.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<int> getVariantId(String id) async {
    final box = await db.getBox(cartBox);
    final cartItemJson = box.get(id);
    if (cartItemJson != null) {
      final cartItem = CartItem.fromJsonString(cartItemJson);
      return cartItem.quantity;
    }
    return 0;
  }

  Future<BaseResponse<PagingResponse<CartItem>>> getCartProducts() async {
    final box = await db.getBox(cartBox);
    final products = <CartItem>[];
    for (var key in box.keys) {
      final product = box.get(key);
      if (product != null && product is String) {
        final productModel = CartItem.fromJsonString(product);
        products.add(productModel);
      }
    }
    return BaseResponse(
      data: PagingResponse(
        items: products,
        totalItems: products.length,
        totalPages: 1,
        currentPage: 1,
      ),
    );
  }
}
