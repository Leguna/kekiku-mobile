part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loggedOut() = _LoggedOut;

  const factory AuthState.updated(User? user) = _Updated;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.form(email,password,valid) = _Form;

  const factory AuthState.checked(isEmail) = _Checked;

  const factory AuthState.error(String message) = _Error;
}
