import 'dart:convert';

import '../../core/index.dart';

class CartLocalDatabase {
  final LocalDatabase db = getIt<LocalDatabase>();

  final String cartBox = 'cart';

  CartLocalDatabase();

  Future<Product> insertProduct(Product product) async {
    final box = await db.getBox(cartBox);
    var newProduct = product.copyWith(quantity: 1);

    final productStored = box.get(product.id);
    if (productStored != null) {
      final storedProduct = Product.fromJsonString(productStored);
      newProduct = storedProduct.copyWith(quantity: storedProduct.quantity + 1);
    }
    var productJson = jsonEncode(newProduct.toJson());
    await box.put(product.id, productJson);
    return newProduct;
  }

  Future<Product> decrementProductQuantity(Product product) async {
    final box = await db.getBox(cartBox);

    var updatedProduct = product.copyWith(quantity: 0);
    final productStored = box.get(product.id);

    if (productStored != null) {
      final storedProduct = Product.fromJsonString(productStored);
      updatedProduct =
          storedProduct.copyWith(quantity: storedProduct.quantity - 1);
    }

    if (updatedProduct.quantity > 0) {
      var productJson = jsonEncode(updatedProduct.toJson());
      await box.put(product.id, productJson);
    } else {
      await box.delete(product.id);
    }
    return updatedProduct;
  }

  Future<bool> deleteProduct(Product product) async {
    try {
      final box = await db.getBox(cartBox);
      await box.delete(product.id);
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

  Future<int> getProductQuantity(String id) async {
    final box = await db.getBox(cartBox);
    final productStored = box.get(id);
    if (productStored != null) {
      final product = Product.fromJsonString(productStored);
      return product.quantity;
    }
    return 0;
  }

  Future<List<Product>> getCartProducts() async {
    final box = await db.getBox(cartBox);
    final products = <Product>[];
    for (var key in box.keys) {
      final product = box.get(key);
      if (product != null && product is String) {
        final productModel = Product.fromJsonString(product);
        products.add(productModel);
      }
    }
    return products;
  }
}
