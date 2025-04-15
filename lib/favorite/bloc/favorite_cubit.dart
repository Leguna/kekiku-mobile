import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/index.dart';
import '../../product/data_sources/product_repository.dart';

part 'favorite_cubit.freezed.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState<Product>> {
  FavoriteCubit() : super(const FavoriteState.initial());

  final ProductRepository _productRepository = getIt<ProductRepository>();
  PagingState<int, Product> pagingState = PagingState<int, Product>();

  Future<void> getFavorites() async {
    emit(const FavoriteState.loading());
    final products = await _productRepository.getFavorites();
    pagingState = pagingState.copyWith(
      hasNextPage: false,
      isLoading: false,
    );
    emit(FavoriteState.loaded(products));
  }

  Future<void> setFavorite(Product product, bool isFavorite) async {
    if (isFavorite) {
      await _productRepository.removeFavorite(product);
    } else {
      await _productRepository.addFavorite(product);
    }
    emit(FavoriteState.favoriteChanged(product.id, !isFavorite));
  }

  Future<bool> isFavorite(String id) async {
    final isFavorite = await _productRepository.isFavorite(id);
    return isFavorite;
  }
}
