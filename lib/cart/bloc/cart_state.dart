part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  const factory CartState.loading() = _Loading;

  const factory CartState.loaded({required Cart cart}) = _Loaded;

  const factory CartState.error(String message) = _Error;

  const factory CartState.empty() = _Empty;
}
