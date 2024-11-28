import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekiku/core/services/google_sso.dart';
import 'package:local_auth/local_auth.dart';

import '../../core/index.dart';
import '../models/user.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial()) {
    init();
  }

  bool get isLoggedIn => state.maybeWhen(
        updated: (_) => true,
        orElse: () => false,
      );

  final ss = getIt<SecureStorageManager>();
  final ds = getIt<AuthRepository>();
  User? user;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> createProfileKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final verificationCodeController = TextEditingController();

  bool isFormValid = false;
  bool codeVerify = false;
  bool isUsingEmail = false;
  bool showPassword = false;

  Future<void> validateForm({createProfileKey}) async {
    final form = createProfileKey ?? formKey;
    isFormValid = form.currentState!.validate();
    emit(AuthState.form(
      emailController.text,
      passwordController.text,
      isFormValid,
    ));
  }

  Future<void> init() async {
    emit(const AuthState.loading());
    passwordController.text = '';
    final selectedId = await ss.readData(userKey);
    if (selectedId == null) {
      emit(const AuthState.loggedOut());
      return;
    }
    final userJson = await ss.readData(selectedId);
    if (userJson != null) {
      user = User.fromJson(jsonDecode(userJson));
      emit(AuthState.updated(user!));
    } else {
      emit(const AuthState.loggedOut());
    }
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    await ss.deleteData(userKey);
    final googleSignIn = getIt<GoogleSSOService>();
    await googleSignIn.googleSignIn.signOut();
    user = null;
    emit(const AuthState.loggedOut());
  }

  Future<void> loginWithGoogle() async {
    try {
      emit(const AuthState.loading());
      final googleSSOService = getIt<GoogleSSOService>();
      final googleUser = await googleSSOService.signIn();

      if (googleUser == null) throw Exception(Strings.failedToLogin);

      // user = await ds.loginWithGoogle(googleUser.id);
      user = User(
        id: googleUser.id,
        email: googleUser.email,
        displayName: googleUser.displayName ?? '',
        photoUrl: googleUser.photoUrl ?? '',
        username: nameToUsername(
            googleUser.displayName ?? Random().nextInt(1000).toString()),
      );
      await ss.writeData(userKey, user!.id);
      await ss.writeData(user!.id, jsonEncode(user!.toJson()));
      emit(const AuthState.success(Strings.successLogin));
      emit(AuthState.updated(user!));
    } catch (e) {
      emit(const AuthState.error(Strings.failedToLogin));
    }
  }

  Future<void> tryVerification({bool isRegister = false}) async {
    emit(const AuthState.loading());
    try {
      final text = emailController.text;
      final isEmail = Validators.isEmail(text);
      await Future.delayed(const Duration(seconds: 1));
      if (!isEmail) {
      } else {}
      isUsingEmail = isEmail;
      isFormValid = false;

      emit(AuthState.form(
        emailController.text,
        passwordController.text,
        false,
      ));
      emit(AuthState.checked(isEmail));
      if (isRegister) {
        passwordController.clear();
        resend();
        return;
      }
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

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
    isUsingEmail = false;
    emailController.clear();
    passwordController.clear();
    emit(const AuthState.initial());
  }

  Future<void> login() async {
    emit(const AuthState.loading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      final email = emailController.text;
      final password = passwordController.text;
      var isSuccess = false;
      if (isUsingEmail) {
        isSuccess = await ds.loginWithEmail(email, password);
      } else {
        isSuccess = await ds.loginWithPhone(email, password);
      }
      if (!isSuccess) {
        emit(const AuthState.error(Strings.failedToLogin));
        return;
      }
      await ss.writeData(userKey, user!.id);
      await ss.writeData(user!.id, jsonEncode(user!.toJson()));
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
        ds.loginWithFingerprint();
        emit(const AuthState.success('Success login with fingerprint'));
        return;
      }
      emit(const AuthState.error(Strings.featureNotImplemented));
    } catch (e) {
      emit(const AuthState.error(Strings.failedToLogin));
    }
  }

  bool canResend = false;

  Future<void> validateFormVerifyCode(String value) async {
    if (verificationCodeController.text.length == 6) {
      emit(const AuthState.loading());
      await Future.delayed(const Duration(seconds: 1));
      emit(const AuthState.success(Strings.codeVerified));
    }
  }

  void onTimerVerifyEnd() {
    emit(const AuthState.loading());
    canResend = true;
    emit(const AuthState.initial());
  }

  void resend() async {
    verificationCodeController.clear();
    if (!canResend) return;
    emit(const AuthState.loading());
    // TODO: Request new verification code
    await Future.delayed(const Duration(seconds: 1));
    canResend = false;
    emit(const AuthState.success(Strings.verificationCodeSent));
  }

  Future<void> createProfile() async {
    emit(const AuthState.loading());
    await Future.delayed(const Duration(seconds: 1));
    user = User(
      id: randomString(),
      email: (isUsingEmail) ? emailController.text : '',
      displayName: userNameController.text,
      phone: (!isUsingEmail) ? emailController.text : '',
      photoUrl: '',
    );
    emit(const AuthState.success(Strings.profileCreated));
    await ss.writeData(userKey, user!.id);
    await ss.writeData(user!.id, jsonEncode(user!.toJson()));
    emit(AuthState.updated(user));
  }

  Future<void> setUser(User user) async {
    this.user = user;
    await ss.writeData(userKey, user.id);
    await ss.writeData(user.id, jsonEncode(user.toJson()));
    emit(AuthState.updated(user));
  }
}
