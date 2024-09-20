import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:workmanager/workmanager.dart';

import 'core/index.dart';
import 'core/services/firebase/firebase_service.dart';
import 'core/services/firebase/firestore_service.dart';
import 'core/services/firebase/push_messaging_service.dart';
import 'core/services/notification_service.dart';

var initialized = false;

Future<void> setupServices({bool isBackground = false}) async {
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

    final localDatabase = LocalDatabase();
    Workmanager workManager = Workmanager();
    getIt.registerLazySingleton(() => workManager);
    getIt.registerLazySingleton(() => localDatabase);

    // Firebase
    FirebaseService firebaseService = await FirebaseService().init();
    getIt.registerSingleton<FirebaseService>(firebaseService);
    if (!isBackground) {
      PushMessagingService firebasePushMessaging = PushMessagingService();
      getIt.registerSingleton<PushMessagingService>(
        await firebasePushMessaging.init(),
      );
    }
    FirestoreService firestoreService = FirestoreService();
    getIt.registerSingleton<FirestoreService>(firestoreService);

    final Dio dio = Dio(BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? dotenv.env['DEV_BASE_URL'] ?? '',
    ));
    getIt.registerSingleton<BaseApiClient>(BaseApiClient(dio));
    getIt.registerSingleton<AuthApiClient>(AuthApiClient(dio));
  } catch (e) {
    // ignore: avoid_print
    print('Error initializing services: $e');
  }
}
