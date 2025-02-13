import '../../core/data_sources/local_database.dart';
import '../../core/models/product_mdl.dart';

class CartLocalDatabase {
  final LocalDatabase db;

  final String cartBox = 'cart';

  CartLocalDatabase({required this.db});

  Future<void> insertProduct(Product product) async {}

  Future<void> updateCart(Product product) async {}
}
