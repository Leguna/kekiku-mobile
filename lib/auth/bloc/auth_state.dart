part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loggedOut() = LoggedOut;

  const factory AuthState.updated(User? user) = AuthUserUpdated;

  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.form(email, password, valid) = FormUpdated;

  const factory AuthState.checked(isEmail) = AuthChecked;

  const factory AuthState.error(String message) = AuthError;

  const factory AuthState.success(String message) = AuthSuccess;

  const factory AuthState.verified() = _Verified;
}
