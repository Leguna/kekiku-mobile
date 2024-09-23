part of 'bottom_nav_bar_cubit.dart';

sealed class BottomNavBarState {
  final int index = 0;
}

final class BottomNavBarInitial extends BottomNavBarState {
}

final class BottomNavBarChanged extends BottomNavBarState {
}

final class BottomNavBarError extends BottomNavBarState {
  final String message;

  BottomNavBarError(this.message);
}
