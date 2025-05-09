import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../strings.dart';

class GoogleSSOService {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'profile',
    ],
  );

  void addListener(Function(GoogleSignInAccount?) listener) {
    googleSignIn.onCurrentUserChanged.listen(listener);
  }

  Future<GoogleSignInAccount> signIn() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) throw Exception(Strings.failedToLogin);
    return googleUser;
  }

  Future<String> getAccessToken() async {
    final googleSignInAuthentication =
        await googleSignIn.currentUser?.authentication;
    return googleSignInAuthentication?.accessToken ?? '';
  }

  Future<String> getIdToken() async {
    final googleSignInAuthentication =
        await googleSignIn.currentUser?.authentication;
    return googleSignInAuthentication?.idToken ?? '';
  }

  Future<void> signOut() async {
    try {
      await googleSignIn.signOut();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  loginSilently() {
    return googleSignIn.signInSilently();
  }
}
