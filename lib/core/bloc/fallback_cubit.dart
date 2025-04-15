import 'package:freezed_annotation/freezed_annotation.dart';

import '../index.dart';

part 'fallback_cubit.freezed.dart';

part 'fallback_state.dart';

class FallbackCubit extends Cubit<FallbackState> {
  FallbackCubit() : super(const FallbackState.initial());

  void showError(String message, String code) {
    emit(FallbackState.error(message: message, code: code));
  }

  void logout() {
    emit(const FallbackState.error(
      message: "Session expired, please login again",
      code: "session_expired",
    ));
    emit(const FallbackState.moveToLogin());
  }
}
