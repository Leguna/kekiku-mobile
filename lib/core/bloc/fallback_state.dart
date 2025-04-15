part of 'fallback_cubit.dart';

@freezed
sealed class FallbackState with _$FallbackState {
  const factory FallbackState.initial() = _Initial;

  const factory FallbackState.error({
    required String message,
    required String code,
  }) = FallbackError;

  const factory FallbackState.moveToLogin() = MoveToLogin;
}
