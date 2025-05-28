import 'package:kekiku/cart/data_sources/cart_local_database.dart';
import 'package:kekiku/cart/models/cart_item_mdl.dart';
import 'package:kekiku/cart/models/cart_response.dart';
import 'package:kekiku/cart/models/transaction_search_params.dart';
import 'package:kekiku/core/models/paging_response.dart';

import '../../core/index.dart';

class CartRepository {
  final CartLocalDatabase cartLocalDatabase;

  CartRepository({
    required this.cartLocalDatabase,
  });

  Future<BaseResponse<CartResponse>> fetchCart() async {
    final cartResponse = await cartLocalDatabase.getCartProducts();
    return cartResponse;
  }

  Future<CartItem> addProductToCart(String variantId) async {
    return await cartLocalDatabase.insertProduct(variantId);
  }

  Future<BaseResponse> buyAgainFromTransaction(String transactionId) async {
    final response = await cartLocalDatabase.buyAgainFromTransaction(transactionId);
    return response;
  }

  Future<CartItem> removeProductFromCart(String variantId) async {
    return await cartLocalDatabase.decrementProductQuantity(variantId);
  }

  Future<bool> removeAllThisProductFromCart(String variantId) async {
    return await cartLocalDatabase.deleteProduct(variantId);
  }

  Future<void> clearCart() async {
    await cartLocalDatabase.clearCart();
  }

  Future<void> updateProductQuantity(Product product, int quantity) async {
    await cartLocalDatabase.updateProductQuantity(product, quantity);
  }

  Future<int> getVariantQuantity(String variantId) async {
    return await cartLocalDatabase.getVariantId(variantId);
  }

  Future<int> getTotalQuantity() async {
    int totalQuantity = 0;
    final products = await fetchCart();
    for (var product in products.data.items) {
      totalQuantity += product.quantity;
    }
    return totalQuantity;
  }

  Future<BaseResponse> checkout() async {
    return await cartLocalDatabase.checkout();
  }

  Future<BaseResponse<PagingResponse<Transaction>>> getTransactions({
    TransactionSearchParams transactionSearchParams =
        const TransactionSearchParams(),
  }) async {
    return await cartLocalDatabase.getTransactions(
      transactionSearchParams: transactionSearchParams,
    );
  }

  Future<BaseResponse> cancelTransaction(Transaction transaction) async {
    return await cartLocalDatabase.cancelTransaction(transaction);
  }

  Future<BaseResponse> finishTransaction(Transaction transaction) async {
    return await cartLocalDatabase.finishTransaction(transaction);
  }
}
