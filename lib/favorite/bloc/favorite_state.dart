part of 'favorite_cubit.dart';

@freezed
class FavoriteState<T> with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;

  const factory FavoriteState.loading() = _Loading;

  const factory FavoriteState.loaded(List<T> products) = FavoriteLoaded<T>;

  const factory FavoriteState.favoriteChanged(String id, bool isFavorite) =
      FavoriteChanged;

  const factory FavoriteState.error(String message) = FavoriteError;
}
