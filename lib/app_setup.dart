import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kekiku/product/data_sources/product_local_source.dart';
import 'package:kekiku/product/data_sources/product_remote_source.dart';
import 'package:kekiku/product/data_sources/product_repository.dart';

import 'core/index.dart';
import 'core/services/firebase/firebase_service.dart';
import 'core/services/google_sso.dart';
import 'notification/data_sources/notification_local_source.dart';
import 'notification/data_sources/notification_repository.dart';

var initialized = false;

Future<void> setupServices() async {
  if (initialized) return;
  initialized = true;
  await dotenv.load(fileName: '.env');

  await Hive.initFlutter();
  GoogleFonts.config.allowRuntimeFetching = false;

  getIt.registerSingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>());

  getIt.registerSingleton<LocalDatabase>(LocalDatabase());
  getIt.registerSingleton<SecureStorageManager>(SecureStorageManager());

  final dio = BaseApiClient.setupDio();
  getIt.registerSingleton(dio);
  dio.interceptors.add(TokenRefreshInterceptor());

  getIt.registerSingleton<AuthRepository>(AuthRepository(AuthApiClient()));
  FirebaseApp? firebaseApp = await FirebaseService().init();
  if (firebaseApp != null) {
    getIt.registerSingleton<FirebaseApp>(firebaseApp);
  }
  GoogleSSOService googleSSOService = GoogleSSOService();
  getIt.registerSingleton<GoogleSSOService>(googleSSOService);

  getIt.registerSingleton<ProductRepository>(
    ProductRepository(
      remoteDataSource: ProductRemoteSource(),
      localDataSource: ProductLocalSource(),
    ),
  );

  getIt.registerSingleton<NotificationRepository>(
    NotificationRepository(NotificationLocalSource()),
  );
}
