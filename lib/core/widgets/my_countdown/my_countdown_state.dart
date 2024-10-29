part of 'my_countdown_cubit.dart';

@freezed
class MyCountdownState with _$MyCountdownState {
  const factory MyCountdownState.initial() = _Initial;

  const factory MyCountdownState.finished() = _Finished;

  const factory MyCountdownState.counting(int count) = _Counting;
}
