part of 'bottom_nav_bar_cubit.dart';

@freezed
class BottomNavBarState with _$BottomNavBarState {
  const factory BottomNavBarState.initial({page}) = _Initial;

  const factory BottomNavBarState.success({page}) = _Success;
}
