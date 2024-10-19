import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekiku/core/services/google_sso.dart';

import '../../core/index.dart';
import '../models/user.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

const userKey = 'user';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  final db = getIt<LocalDatabase>();
  final ds = getIt<AuthRepository>();
  User? user;

  get isLoggedIn => user != null;

  Future<void> logout() async {
    emit(const AuthState.loading());
    await db.clearKey(userKey);
    final googleSignIn = getIt<GoogleSSOService>();
    await googleSignIn.googleSignIn.signOut();
    emit(const AuthState.loggedOut());
  }

  Future<void> loginWithGoogle() async {
    emit(const AuthState.loading());
    final googleSSOService = getIt<GoogleSSOService>();
    final googleUser = await googleSSOService.signIn();

    if (googleUser == null) {
      emit(const AuthState.error('Google Sign In Failed'));
      return;
    }

    final response = await ds.loginWithGoogle(googleUser.idToken);

    if (response['error'] != null) {
      emit(AuthState.error(response['error']));
      return;
    }
  }
}
