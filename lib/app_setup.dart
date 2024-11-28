import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:workmanager/workmanager.dart';

import 'core/index.dart';
import 'core/services/firebase/firebase_service.dart';
import 'core/services/google_sso.dart';

var initialized = false;

Future<void> setupServices() async {
  try {
    if (initialized) return;
    initialized = true;
    await dotenv.load(fileName: '.env');

    await Hive.initFlutter();
    GoogleFonts.config.allowRuntimeFetching = false;

    getIt.registerSingleton<LocalDatabase>(LocalDatabase());
    getIt.registerSingleton<Workmanager>(Workmanager());
    getIt.registerSingleton<SecureStorageManager>(SecureStorageManager());

    getIt.registerSingleton<Dio>(Dio(BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? dotenv.env['DEV_BASE_URL'] ?? '',
    )));
    getIt.registerSingleton<AuthRepository>(AuthRepository(AuthApiClient()));
    FirebaseApp? firebaseApp = await FirebaseService().init();
    if (firebaseApp != null) {
      getIt.registerSingleton<FirebaseApp>(firebaseApp);
    }
    GoogleSSOService googleSSOService = GoogleSSOService();
    getIt.registerSingleton<GoogleSSOService>(googleSSOService);
  } catch (e) {
    // ignore: avoid_print
    print('Error initializing services: $e');
  }
}
