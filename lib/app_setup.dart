import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:workmanager/workmanager.dart';

import 'core/index.dart';
import 'core/services/firebase/firebase_service.dart';
import 'core/services/google_sso.dart';
import 'core/services/notification_service.dart';

var initialized = false;

Future<void> setupServices() async {
  try {
    if (initialized) return;
    initialized = true;
    await dotenv.load(fileName: '.env');

    await Hive.initFlutter();
    await FlutterDownloader.initialize(
      debug: true,
      ignoreSsl: true,
    );
    GoogleFonts.config.allowRuntimeFetching = false;
    if (!kIsWeb) await setupFlutterNotifications();

    getIt.registerLazySingleton(() => Workmanager());
    getIt.registerLazySingleton(() => LocalDatabase());

    getIt.registerSingleton<TokenManager>(TokenManager());

    final Dio dio = Dio(BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? dotenv.env['DEV_BASE_URL'] ?? '',
    ));
    getIt.registerSingleton<Dio>(dio);
    getIt.registerSingleton<BaseApiClient>(BaseApiClient(dio));
    getIt.registerSingleton<AuthRepository>(AuthRepository(AuthApiClient(dio)));
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
