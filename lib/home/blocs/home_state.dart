part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.imagePopup({required bool isShowed}) = _ImagePopup;
}
