import 'package:kekiku/cart/data_sources/cart_local_database.dart';

import '../../core/index.dart';

class CartRepository {
  final CartLocalDatabase cartLocalDatabase;

  CartRepository({
    required this.cartLocalDatabase,
  });

  Future<List<Product>> fetchCart() async {
    return await cartLocalDatabase.getCartProducts();
  }

  Future<Product> addProductToCart(Product product) async {
    return await cartLocalDatabase.insertProduct(product);
  }

  Future<Product> removeProductFromCart(Product product) async {
    return await cartLocalDatabase.decrementProductQuantity(product);
  }

  Future<bool> removeAllThisProductFromCart(Product product) async {
    return await cartLocalDatabase.deleteProduct(product);
  }

  Future<void> clearCart() async {
    await cartLocalDatabase.clearCart();
  }

  Future<void> updateProductQuantity(Product product, int quantity) async {
    await cartLocalDatabase.updateProductQuantity(product, quantity);
  }

  Future<int> getProductQuantity(Product product) async {
    return await cartLocalDatabase.getProductQuantity(product.id);
  }

  Future<int> getTotalQuantity() async {
    int totalQuantity = 0;
    final products = await fetchCart();
    for (var product in products) {
      totalQuantity += product.quantity;
    }
    return totalQuantity;
  }

  Future<double> getTotalPrice() async {
    final products = await fetchCart();
    double totalPrice = 0.0;
    for (var product in products) {
      totalPrice += product.price * product.quantity;
    }
    return totalPrice;
  }

  getDeliveryFee() {
    return 12.0;
  }
}
