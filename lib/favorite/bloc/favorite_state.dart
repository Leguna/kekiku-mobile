part of 'favorite_cubit.dart';

@freezed
class FavoriteState<T> with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;

  const factory FavoriteState.loading() = _Loading;

  const factory FavoriteState.loaded(List<T> products) = _Loaded<T>;

  const factory FavoriteState.favoriteChanged(String id, bool isFavorite) =
      _FavoriteChanged;

  const factory FavoriteState.error(String message) = _Error;
}
