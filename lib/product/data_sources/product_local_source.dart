import 'dart:convert';

import 'package:kekiku/core/index.dart';

import '../../core/data_sources/json_from_assets.dart';

class ProductLocalSource {
  final LocalDatabase localDatabase = getIt<LocalDatabase>();

  final String _favoriteKey = 'favorite';

  // Get product by id
  Future<String> getProductById(String id) async {
    final jsonProduct = jsonDecode(await getJson(Assets.jsons.cake));
    final product = jsonProduct.firstWhere((element) => element['id'] == id);
    return jsonEncode(product);
  }

  // Get product by variant id
  Future<String> getProductByVariantId(String id) async {
    final jsonProduct = jsonDecode(await getJson(Assets.jsons.cake));

    final product = jsonProduct.cast<Map<String, dynamic>>().firstWhere(
      (element) {
        final variants = element?['variants'] ?? [];
        if (variants is List) {
          return variants.any((variant) => variant['id'] == id);
        }
        return false;
      },
      orElse: () => <String, dynamic>{},
    );
    return product != null ? jsonEncode(product) : "";
  }

  Future<String> getProductFromJson({String query = ""}) async {
    final jsonProduct = jsonDecode(await getJson(Assets.jsons.cake));

    final favorite = await getFavorites();
    for (final item in jsonProduct) {
      item['isFavorite'] = favorite.contains(item['id']);
    }

    final products = {
      'success': true,
      'statusCode': 200,
      'message': 'Success',
      'data': {
        'currentPage': 1,
        'totalPages': 1,
        'pageSize': 10,
        'totalItems': 10,
        'items': jsonProduct,
      },
      'errors': [],
    };
    return jsonEncode(products);
  }

  Future<String> getTransactionFromJson({
    String query = '',
    String status = '',
    String type = '',
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    var jsonData = jsonDecode(await getJson(Assets.jsons.transaction));

    if (query.isNotEmpty) {
      final filtered = jsonData
          .where((element) => element['products'][0]['name']
              .toString()
              .toLowerCase()
              .contains(query))
          .toList();
      jsonData = filtered;
    }

    if (status.isNotEmpty) {
      final filtered = jsonData
          .where((element) =>
              element['status'].toString().toLowerCase().contains(status))
          .toList();
      jsonData = filtered;
    }

    if (type.isNotEmpty) {
      final filtered = jsonData
          .where((element) =>
              element['type'].toString().toLowerCase().contains(type))
          .toList();
      jsonData = filtered;
    }

    if (startDate != null && endDate != null) {
      final filtered = jsonData.where((element) {
        final date = DateTime.parse(element['date']);
        return date.isAfter(startDate) && date.isBefore(endDate);
      }).toList();
      jsonData = filtered;
    }

    final transactions = {
      'success': true,
      'statusCode': 200,
      'message': 'Success',
      'data': {
        'currentPage': 1,
        'totalPages': 1,
        'pageSize': 10,
        'totalItems': 10,
        'items': jsonData,
      },
      'errors': [],
    };
    return jsonEncode(transactions);
  }

  Future<void> addFavorite(String id, String value) async {
    await localDatabase.setString(
      id,
      value,
      boxKey: _favoriteKey,
    );
  }

  Future<List<String>> getFavorites() async {
    final box = await localDatabase.getBox(_favoriteKey);
    return box.values.map((e) => e as String).toList();
  }

  Future<void> removeFavorite(String id) async {
    await localDatabase.clearKey(id, boxKey: _favoriteKey);
  }

  Future<bool> isFavorite(String id) async {
    final box = await localDatabase.getBox(_favoriteKey);
    return box.containsKey(id);
  }
}
