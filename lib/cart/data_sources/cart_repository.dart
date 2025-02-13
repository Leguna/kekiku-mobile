import '../../core/index.dart';
import '../models/cart_mdl.dart';

class CartRepository {
  final LocalDatabase cartLocalDatabase = LocalDatabase();

  CartRepository();

  Future<Cart> fetchCart() async {
    final cartData = await cartLocalDatabase.getBox('cart');
    final products = cartData.values.map((e) => Product.fromJson(e)).toList();
    return Cart(products: products);
  }

  Future<void> addProductToCart(Product product) async {}

  Future<void> removeProductFromCart(Product product) async {}

  Future<void> clearCart() async {}

  Future<void> updateProductQuantity(Product product, int quantity) async {}
}
