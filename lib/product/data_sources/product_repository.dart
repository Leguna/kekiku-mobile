import 'dart:convert';

import '../../core/index.dart';
import '../../core/models/paging_response.dart';
import 'product_local_source.dart';
import 'product_remote_source.dart';

class ProductRepository {
  const ProductRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final ProductRemoteSource remoteDataSource;
  final ProductLocalSource localDataSource;

  Future<BaseResponse<PagingResponse<Product>>> getProducts({
    page = 1,
    limit = 10,
  }) async {
    final response = await localDataSource.getProductFromJson();
    final data = BaseResponse<PagingResponse<Product>>.fromJson(
      jsonDecode(response),
      (json) => PagingResponse<Product>.fromJson(
        json as Map<String, dynamic>,
        (json) => Product.fromJson(json as Map<String, dynamic>),
      ),
    );
    return data.copyWith(
      success: true,
      data: data.data.copyWith(
        currentPage: 1,
        totalPages: 1,
        pageSize: 10,
      ),
    );
  }

  Future<BaseResponse<PagingResponse<Product>>> searchProducts({
    required String query,
    page = 1,
    limit = 10,
  }) async {
    final response = await localDataSource.getProductFromJson();
    final data = BaseResponse<PagingResponse<Product>>.fromJson(
      jsonDecode(response),
      (json) => PagingResponse<Product>.fromJson(
        json as Map<String, dynamic>,
        (json) => Product.fromJson(json as Map<String, dynamic>),
      ),
    );

    final dataFiltered = data.data.copyWith(
      items: data.data.items.where((element) {
        return element.name
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList(),
    );

    return data.copyWith(
      success: true,
      data: dataFiltered.copyWith(
        currentPage: 1,
        totalPages: 1,
        pageSize: 10,
      ),
    );
  }

  Future<void> addFavorite(Product product) async {
    await localDataSource.addFavorite(product.id, jsonEncode(product.toJson()));
  }

  Future<List<Product>> getFavorites() async {
    final favoriteIds = await localDataSource.getFavorites();
    final favoriteProducts = <Product>[];
    for (final id in favoriteIds) {
      final product = Product.fromJsonString(id);
      favoriteProducts.add(product);
    }
    return favoriteProducts;
  }

  Future<bool> isFavorite(String productId) async {
    return await localDataSource.isFavorite(productId);
  }

  Future<void> removeFavorite(Product product) async {
    await localDataSource.removeFavorite(product.id);
  }

  Future<List<Transaction>> getTransactions({
    query = '',
    type = '',
    status = '',
    endDate,
    startDate,
  }) async {
    // final response = await localDataSource.getTransactionFromJson(
    //   query: query,
    //   type: type,
    //   status: status,
    //   endDate: endDate,
    //   startDate: startDate,
    // );
    final response = await localDataSource.getTransactionFromJson();
    final data = BaseResponse<PagingResponse<Transaction>>.fromJson(
      jsonDecode(response),
      (json) => PagingResponse<Transaction>.fromJson(
        json as Map<String, dynamic>,
        (json) => Transaction.fromJson(json as Map<String, dynamic>),
      ),
    );
    return data.data.items;
  }

  Future<BaseResponse<PagingResponse<Product>>> getPopularProducts() {
    return getProducts();
  }
}
