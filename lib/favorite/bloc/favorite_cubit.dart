import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/index.dart';
import '../../product/data_sources/product_repository.dart';

part 'favorite_cubit.freezed.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState.initial());

  final ProductRepository _productRepository = getIt<ProductRepository>();
  final PagingController<int, Product> pagingController =
      PagingController(firstPageKey: 1);

  Future<void> getFavorites() async {
    emit(const FavoriteState.loading());
    pagingController.itemList = [];
    pagingController.refresh();
    pagingController.appendLastPage(await _productRepository.getFavorites());
    emit(FavoriteState.loaded(pagingController.itemList!));
  }

  Future<void> setFavorite(Product product, bool isFavorite) async {
    if (isFavorite) {
      await _productRepository.removeFavorite(product);
    } else {
      await _productRepository.addFavorite(product);
    }
  }

  Future<bool> isFavorite(String id) async {
    final isFavorite = await _productRepository.isFavorite(id);
    return isFavorite;
  }
}
