import 'dart:async';
import 'dart:convert';

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

  final emailController =
      TextEditingController(text: 'ahmadtuflihunxd@gmail.com');
  final passwordController = TextEditingController(text: 'password');
  final userNameController = TextEditingController(text: 'ahmad');
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
      user = await ds.loginWithGoogleToken();
      await ss.writeData(userKey, user!.id);
      await ss.writeData(user!.id, jsonEncode(user!.toJson()));
      emit(AuthState.updated(user!));
    } catch (e) {
      emit(const AuthState.error(Strings.failedToLogin));
    }
  }

  void togglePassword() {
    emit(const AuthState.loading());
    showPassword = !showPassword;
    emit(const AuthState.initial());
  }

  void reset() {
    showPassword = false;
    codeVerify = false;
    canResend = true;
    isUsingEmail = false;
    isFormValid = false;
    emailController.clear();
    passwordController.clear();
    verificationCodeController.clear();
    userNameController.clear();
    emit(const AuthState.initial());
  }

  Future<void> login() async {
    try {
      emit(const AuthState.loading());
      final email = emailController.text;
      final password = passwordController.text;
      if (isUsingEmail) {
        user = await ds.loginWithEmail(email, password);
      } else {
        user = await ds.loginWithPhone(email, password);
      }
      emit(AuthState.updated(user));
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

  bool canResend = true;

  void onTimerVerifyEnd() {
    emit(const AuthState.loading());
    canResend = true;
    emit(const AuthState.initial());
  }

  Future<void> setUser(User user) async {
    this.user = user;
    await ss.writeData(userKey, user.id);
    await ss.writeData(user.id, jsonEncode(user.toJson()));
    emit(AuthState.updated(user));
  }

  Future<void> checkEmailOrPhone() async {
    emit(const AuthState.loading());
    if (Validators.isEmail(emailController.text)) {
      isUsingEmail = true;
    } else {
      isUsingEmail = false;
    }
    emit(const AuthState.initial());
  }

  Future<void> trySendVerificationMessage({bool isRegister = false}) async {
    try {
      emit(const AuthState.loading());
      final text = emailController.text;
      final isEmail = Validators.isEmail(text);

      isUsingEmail = isEmail;

      emit(AuthState.form(
        emailController.text,
        passwordController.text,
        false,
      ));
      if (isRegister) {
        passwordController.clear();
        resendCodeVerificationCode();
        return;
      }
      emit(const AuthState.error("Failed to send verification message"));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> registerEmail() async {
    try {
      emit(const AuthState.loading());
      final text = emailController.text;
      final isEmail = Validators.isEmail(text);

      isUsingEmail = isEmail;

      emit(AuthState.form(
        emailController.text,
        passwordController.text,
        false,
      ));
      await resendCodeVerificationCode();
    } catch (e) {
      isFormValid = true;
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> resendCodeVerificationCode() async {
    try {
      if (!canResend) return;
      canResend = false;

      emit(const AuthState.loading());
      passwordController.clear();
      verificationCodeController.clear();
      await ds.sendVerificationEmail(emailController.text);
      emit(const AuthState.checked(true));
    } catch (e) {
      canResend = true;
      emit(AuthState.error((e as Error).message));
    }
  }

  Future<void> createProfile() async {
    try {
      emit(const AuthState.loading());

      final email = (isUsingEmail) ? emailController.text : '';
      final name = userNameController.text;
      final password = passwordController.text;
      final pin = verificationCodeController.text;

      user = await ds.createProfile(
        email: email,
        name: name,
        password: password,
        pin: pin,
      );

      emit(const AuthState.success(Strings.profileCreated));
      emit(AuthState.updated(user));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> validateFormVerifyCode(String value) async {
    try {
      if (verificationCodeController.text.length == 6) {
        emit(const AuthState.loading());
        final email = emailController.text;
        final code = verificationCodeController.text;
        await ds.validateVerificationCode(email, code);
        emit(const AuthState.verified());
      }
    } catch (e) {
      emit(AuthState.error((e as Error).message));
    }
  }
}
