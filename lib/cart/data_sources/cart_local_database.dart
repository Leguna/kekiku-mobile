import '../../core/data_sources/local_database.dart';
import '../../core/models/product_mdl.dart';

class CartLocalDatabase {
  final LocalDatabase db;

  final String cartBox = 'cart';

  CartLocalDatabase({required this.db});

  Future<void> insertProduct(Product product) async {
    final box = await db.getBox(cartBox);
    final productList = box.get(cartBox) as List<Product>? ?? [];
    productList.add(product);
    await box.put(cartBox, productList);
  }

  Future<List<Product>> getProducts() async {
    final box = await db.getBox(cartBox);
    return box.get(cartBox) as List<Product>? ?? [];
  }

  Future<void> deleteProduct(Product product) async {
    final box = await db.getBox(cartBox);
    final productList = box.get(cartBox) as List<Product>? ?? [];
    productList.remove(product);
    await box.put(cartBox, productList);
  }

  Future<void> clearCart() async {
    final box = await db.getBox(cartBox);
    await box.delete(cartBox);
  }

  Future<void> updateProductQuantity(Product product, int quantity) async {
    final box = await db.getBox(cartBox);
    final productList = box.get(cartBox) as List<Product>? ?? [];
    final index = productList.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      productList.add(product.copyWith(quantity: quantity));
      await box.put(cartBox, productList);
    }
  }
}
