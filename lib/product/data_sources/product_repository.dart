import 'dart:convert';

import 'package:kekiku/core/models/paging_response.dart';

import '../../core/index.dart';
import 'product_local_source.dart';
import 'product_remote_source.dart';

class ProductRepository {
  const ProductRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final ProductRemoteSource remoteDataSource;
  final ProductLocalSource localDataSource;

  Future<BaseResponse<PagingResponse<Product>>> getProducts() async {
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

  Future<void> addFavorite(Product product) async {
    await localDataSource.addFavorite(product.id, jsonEncode(product.toJson()));
  }

  Future<List<Product>> getFavorite() async {
    final favoriteIds = await localDataSource.getFavorite();
    final favoriteProducts = <Product>[];
    for (final id in favoriteIds) {
      final product = Product.fromJsonString(id);
      favoriteProducts.add(product);
    }
    return favoriteProducts;
  }

  Future<bool> isFavorite(Product product) async {
    return await localDataSource.isFavorite(product.id);
  }

  Future<void> removeFavorite(Product product) async {
    await localDataSource.removeFavorite(product.id);
  }
}
