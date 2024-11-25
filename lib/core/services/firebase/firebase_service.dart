import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseService {
  Future<FirebaseApp?> init() async {
    try {
      final options = FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY'] ?? '',
        appId: dotenv.env['FIREBASE_APP_ID'] ?? '',
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '',
        projectId: dotenv.env['FIREBASE_PROJECT_ID'] ?? '',
        authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN'] ?? '',
      );
      await Firebase.initializeApp();
      final app = await Firebase.initializeApp(
        name: 'kekiku',
        options: options,
      );
      return app;
    } catch (e) {
      // ignore: avoid_print
      print('Error initializing Firebase: $e');
    }
    return null;
  }
}
