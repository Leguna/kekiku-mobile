import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../index.dart';

part 'bottom_nav_bar_cubit.freezed.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarState.initial(page: 0));

  VoidCallback? onReset;

  Future<void> reset() async {
    onReset?.call();
    emit(const BottomNavBarState.initial(page: 0));
  }

  Future<void> changePage(int page) async {
    emit(BottomNavBarState.initial(page: page));
  }
}
