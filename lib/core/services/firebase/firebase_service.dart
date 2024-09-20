import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../configs.dart';

class FirebaseService {
  Future<FirebaseService> init() async {
    try {
      final flavor = Flavors.getCurrentFlavor;
      var flavorPrefix = '';
      switch (flavor) {
        case FlavorType.dev:
          flavorPrefix = 'DEV_';
          break;
        case FlavorType.staging:
          flavorPrefix = 'STAG_';
          break;
        case FlavorType.production:
          flavorPrefix = '';
          break;
      }
      final options = FirebaseOptions(
        apiKey: dotenv.env['${flavorPrefix}FIREBASE_API_KEY']??'',
        appId: dotenv.env['${flavorPrefix}FIREBASE_APP_ID']??'',
        messagingSenderId: dotenv.env['${flavorPrefix}FIREBASE_MESSAGING_SENDER_ID']??'',
        projectId: dotenv.env['${flavorPrefix}FIREBASE_PROJECT_ID']??'',
        storageBucket: dotenv.env['${flavorPrefix}FIREBASE_STORAGE_BUCKET']??'',
      );
      await Firebase.initializeApp(
        name: 'kekiku',
        options: options,
      );
    } catch (e) {
      // ignore: avoid_print
      print('Error initializing Firebase: $e');
    }
    return this;
  }
}
