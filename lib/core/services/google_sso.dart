import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSSOService {
  late final GoogleSignIn googleSignIn;

  GoogleSSOService(){
    final List<String> scopes = <String>[
      'email',
      'profile',
    ];

    googleSignIn = GoogleSignIn(
      serverClientId: dotenv.env['GOOGLE_SERVER_CLIENT_ID'],
      scopes: scopes,
    );
  }



  Future<void> handleSignIn() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
