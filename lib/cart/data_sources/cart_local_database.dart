import 'dart:convert';

import 'package:kekiku/cart/models/cart_item_mdl.dart';
import 'package:kekiku/cart/models/cart_response.dart';
import 'package:kekiku/cart/models/transaction_search_params.dart';

import '../../core/index.dart';
import '../../core/models/paging_response.dart';
import '../../product/data_sources/product_local_source.dart';

class CartLocalDatabase {
  final LocalDatabase db = getIt<LocalDatabase>();
  final ProductLocalSource productLocalSource = getIt<ProductLocalSource>();
  final String cartBox = 'cart';
  final String transactionBox = 'transaction';

  CartLocalDatabase();

  Future<CartItem> insertProduct(String variantId, {int quantity = 1}) async {
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
        quantity: quantity,
        variantId: variantId,
        productName: product.name,
        image: selectedVariant.image ?? "",
        variantName: selectedVariant.name ?? "");

    final productStored = box.get(variantId);
    if (productStored != null) {
      final storedProduct = CartItem.fromJsonString(productStored);
      cartItem = cartItem.copyWith(
        quantity: storedProduct.quantity + quantity,
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

  Future<BaseResponse<CartResponse>> getCartProducts() async {
    final box = await db.getBox(cartBox);
    final products = <CartItem>[];
    for (var key in box.keys) {
      final product = box.get(key);
      if (product != null && product is String) {
        final productModel = CartItem.fromJsonString(product);
        products.add(productModel);
      }
    }
    final baseResponse = BaseResponse(
      data: CartResponse(
        basePrice: await totalBasePrice(products),
        deliveryFee: await getDeliveryFee(""),
        totalItem: products.length,
        totalDiscountedPrice: await getTotalDiscountedPrice(products),
        totalPrice: await getTotalPrice(products),
        items: products,
      ),
    );
    return baseResponse;
  }

  Future<BaseResponse> checkout() async {
    final idRandom = randomString();
    final box = await db.getBox(transactionBox);
    final products = await getCartProducts();

    final transaction = Transaction(
      id: idRandom,
      date: DateTime.now().toIso8601String(),
      amount: await getTotalPrice(products.data.items),
      status: TransactionStatus.processing,
      type: TransactionType.purchase,
      quantity: products.data.items.length,
      products: products.data.items,
    );
    final transactionJson = jsonEncode(transaction.toJson());
    await box.put(idRandom, transactionJson);
    await clearCart();
    return BaseResponse(data: {});
  }

  Future<double> totalBasePrice(List<CartItem> cartItems) async {
    double totalBasePrice = 0.0;
    for (var product in cartItems) {
      totalBasePrice += product.basePrice * product.quantity;
    }
    return totalBasePrice;
  }

  Future<double> getDeliveryFee(String addressId) async {
    return 12.0;
  }

  Future<double> getTotalDiscountedPrice(List<CartItem> cartItems) async {
    double totalDiscountedPrice = 0.0;
    for (var product in cartItems) {
      final discountPrice = product.discountValue * product.basePrice / 100;
      totalDiscountedPrice += discountPrice * product.quantity;
    }
    return totalDiscountedPrice;
  }

  Future<double> getTotalPrice(List<CartItem> cartItems) async {
    double totalPrice = await totalBasePrice(cartItems);
    totalPrice += await getDeliveryFee("");
    totalPrice -= await getTotalDiscountedPrice(cartItems);
    return totalPrice;
  }

  Future<BaseResponse<PagingResponse<Transaction>>> getTransactions({
    required TransactionSearchParams transactionSearchParams,
  }) async {
    final box = await db.getBox(transactionBox);
    final transactions = <Transaction>[];
    for (var key in box.keys) {
      final transaction = box.get(key);
      if (transaction != null && transaction is String) {
        final transactionModel = Transaction.fromJsonString(transaction);
        transactions.add(transactionModel);
      }
    }
    transactions.sort((a, b) {
      return DateTime.parse(b.date).compareTo(DateTime.parse(a.date));
    });
    final baseResponse = BaseResponse(
      data: PagingResponse(
        items: transactions,
        totalItems: transactions.length,
        totalPages: 1,
        pageSize: transactions.length,
        currentPage: 1,
      ),
    );
    return baseResponse;
  }

  Future<void> addTransaction(Transaction transaction) async {
    final box = await db.getBox(transactionBox);
    final transactionJson = jsonEncode(transaction.toJson());
    await box.put(transaction.id, transactionJson);
  }

  Future<void> removeAllTransaction() async {
    final box = await db.getBox(transactionBox);
    await box.clear();
  }

  Future<BaseResponse> finishTransaction(Transaction transaction) async {
    final box = await db.getBox(transactionBox);
    if (box.containsKey(transaction.id)) {
      final transactionJson = box.get(transaction.id);
      if (transactionJson != null && transactionJson is String) {
        var existingTransaction = Transaction.fromJsonString(transactionJson);
        if (existingTransaction.status == TransactionStatus.processing) {
          existingTransaction = existingTransaction.copyWith(
            status: TransactionStatus.completed,
          );
          final updatedTransactionJson =
              jsonEncode(existingTransaction.toJson());
          await box.put(transaction.id, updatedTransactionJson);
          return BaseResponse(data: {});
        } else {
          return BaseResponse(
            data: {},
            errors: ['Transaction cannot be completed'],
          );
        }
      }
    }
    return BaseResponse(
      data: {},
      errors: ['Transaction not found'],
    );
  }

  Future<BaseResponse> cancelTransaction(Transaction transaction) async {
    final box = await db.getBox(transactionBox);
    if (box.containsKey(transaction.id)) {
      final transactionJson = box.get(transaction.id);
      if (transactionJson != null && transactionJson is String) {
        var existingTransaction = Transaction.fromJsonString(transactionJson);
        if (existingTransaction.status == TransactionStatus.processing) {
          existingTransaction = existingTransaction.copyWith(
            status: TransactionStatus.cancelled,
          );
          final updatedTransactionJson =
              jsonEncode(existingTransaction.toJson());
          await box.put(transaction.id, updatedTransactionJson);
          return BaseResponse(data: {});
        } else {
          return BaseResponse(
            data: {},
            errors: ['Transaction cannot be cancelled'],
          );
        }
      }
    }
    return BaseResponse(
      data: {},
      errors: ['Transaction not found'],
    );
  }

  Future<BaseResponse> buyAgainFromTransaction(String transactionId) async {
    final box = await db.getBox(transactionBox);
    final transactionJson = await box.get(transactionId);
    if (transactionJson != null && transactionJson is String) {
      final transaction = Transaction.fromJsonString(transactionJson);
      for (var product in transaction.products) {
        final cartItem = await insertProduct(product.variantId);
        await insertProduct(cartItem.variantId, quantity: cartItem.quantity);
      }
    }
    return BaseResponse(data: {});
  }
}
