import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/index.dart';

part 'favorite_cubit.freezed.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState.initial());

  void setFavorite(bool isFavorite) {}
}
