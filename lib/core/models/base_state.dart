import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = _Initial<T>;

  const factory BaseState.loading() = _Loading<T>;

  const factory BaseState.loaded(T data) = _Loaded<T>;

  const factory BaseState.error({@Default('') String message}) = _Error<T>;
}

extension BaseStateExtensions<T> on BaseState<T> {
  bool get isLoading => this is _Loading<T>;

  bool get hasError => this is _Error<T>;

  String get errorMessage =>
      this is _Error<T> ? (this as _Error<T>).message : '';
}
