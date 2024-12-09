import 'dart:convert';

import '../../core/data_sources/json_from_assets.dart';
import '../../core/index.dart';

class ProductLocalSource {
  final LocalDatabase localDatabase = getIt<LocalDatabase>();

  final String _favoriteKey = 'favorite';

  Future<String> getProductFromJson() async {
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
