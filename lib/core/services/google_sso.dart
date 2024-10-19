import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSSOService {
  late final GoogleSignIn googleSignIn;

  GoogleSSOService() {
    final List<String> scopes = <String>[
      'email',
      'profile',
    ];

    googleSignIn = GoogleSignIn(
      serverClientId: dotenv.env['GOOGLE_SERVER_CLIENT_ID'],
      scopes: scopes,
    );
  }

  void addListener(Function(GoogleSignInAccount?) listener) {
    googleSignIn.onCurrentUserChanged.listen(listener);
  }

  Future<GoogleSignInAuthentication?> signIn() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }
      return await googleUser.authentication;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    return null;
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
}
