import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSSOService {
  late final GoogleSignIn _googleSignIn;

  GoogleSSOService(this._googleSignIn){
    final List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];

    _googleSignIn = GoogleSignIn(
      clientId: dotenv.env['GOOGLE_CLIENT_ID'],
      scopes: scopes,
    );
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
