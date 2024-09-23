import 'package:flutter/widgets.dart';

import '../../../index.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  PageController pageController = PageController();
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavBarChanged());
  }

  void jumpToPage(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    emit(BottomNavBarChanged());
  }
}
