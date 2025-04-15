import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_countdown_cubit.freezed.dart';
part 'my_countdown_state.dart';

class MyCountdownCubit extends Cubit<MyCountdownState> {
  MyCountdownCubit() : super(const MyCountdownState.initial());

  void startCountdown(Duration duration) {
    emit(MyCountdownState.counting(duration.inSeconds));
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final count = switch (state) {
        Counting(:final count) => count,
        _ => 0,
      };
      if (count == 0) {
        timer.cancel();
        emit(const MyCountdownState.finished());
      } else {
        emit(MyCountdownState.counting(count - 1));
      }
    });
  }

  void stopCountdown() {
    emit(const MyCountdownState.initial());
  }
}
