part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;

  const factory FavoriteState.loading() = _Loading;

  const factory FavoriteState.loaded(List<Product> products) = _Loaded;

  const factory FavoriteState.error(String message) = _Error;
}
