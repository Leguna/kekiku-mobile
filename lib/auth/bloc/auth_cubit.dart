import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekiku/core/services/google_sso.dart';
import 'package:local_auth/local_auth.dart';

import '../../core/index.dart';
import '../models/user.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

const authBox = 'auth';
const userKey = 'user';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial()) {
    init();
  }

  final db = getIt<LocalDatabase>();
  final ds = getIt<AuthRepository>();
  User? user;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isFormValid = false;
  bool codeVerify = false;
  bool isEmailLogin = false;

  Future<void> validateForm() async {
    isFormValid = formKey.currentState!.validate();
    emit(AuthState.form(
      emailController.text,
      passwordController.text,
      isFormValid,
    ));
  }

  Future<void> init() async {
    emit(const AuthState.loading());
    final selectedId = await db.getString(userKey, boxKey: authBox);
    if (selectedId == null) {
      emit(const AuthState.loggedOut());
      return;
    }
    final userJson = await db.getString(selectedId, boxKey: authBox);

    if (userJson != null) {
      user = User.fromJson(jsonDecode(userJson));
      emit(AuthState.updated(user!));
    } else {
      emit(const AuthState.loggedOut());
    }
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    await db.clearKey(userKey, boxKey: authBox);
    final googleSignIn = getIt<GoogleSSOService>();
    await googleSignIn.googleSignIn.signOut();
    user = null;
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
    user = await ds.loginWithGoogle(googleUser.idToken);
    await db.setString(userKey, user!.id, boxKey: authBox);
    await db.setString(
      user!.id,
      jsonEncode(user!.toJson()),
      boxKey: authBox,
    );
    emit(AuthState.updated(user!));
  }

  Future<void> checkEmailForm() async {
    emit(const AuthState.loading());
    try {
      final text = emailController.text;
      final isEmail = Validators.isEmail(text);
      await Future.delayed(const Duration(seconds: 1));
      if (!isEmail) {
      } else {}
      isEmailLogin = isEmail;
      isFormValid = false;
      emit(AuthState.form(
        emailController.text,
        passwordController.text,
        false,
      ));
      emit(AuthState.checked(isEmail));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  bool showPassword = false;

  void togglePassword() {
    emit(const AuthState.loading());
    showPassword = !showPassword;
    emit(const AuthState.initial());
  }

  void reset() {
    formKey = GlobalKey<FormState>();
    isFormValid = false;
    showPassword = false;
    codeVerify = false;
    isEmailLogin = false;
    emailController.clear();
    passwordController.clear();
    emit(const AuthState.initial());
  }

  login() async {
    emit(const AuthState.loading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      final email = emailController.text;
      final password = passwordController.text;
      if (isEmailLogin) {
        user = await ds.loginWithEmail(email, password);
      } else {
        user = await ds.loginWithPhone(email, password);
      }
      await db.setString(userKey, user!.id, boxKey: authBox);
      await db.setString(
        user!.id,
        jsonEncode(user!.toJson()),
        boxKey: authBox,
      );
      emit(AuthState.updated(user!));
    } catch (e) {
      emit(const AuthState.error(Strings.failedToLogin));
    }
  }

  Future<void> loginFingerprint() async {
    try {
      emit(const AuthState.initial());
      final LocalAuthentication auth = LocalAuthentication();
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();
      if (!canAuthenticate) {
        emit(
            const AuthState.error('Biometric authentication is not available'));
        return;
      }
      final authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          sensitiveTransaction: true,
          useErrorDialogs: true,
          biometricOnly: true,
        ),
      );
      if (authenticated) {
        emit(const AuthState.success('Success login with fingerprint'));
        return;
      }
      emit(const AuthState.error(Strings.featureNotImplemented));
    } catch (e) {
      emit(const AuthState.error(Strings.failedToLogin));
    }
  }
}
