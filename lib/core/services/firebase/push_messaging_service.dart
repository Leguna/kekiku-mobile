import 'package:firebase_messaging/firebase_messaging.dart';

import '../../data_sources/index.dart';
import '../../index.dart';

class PushMessagingService {
  late FirebaseMessaging messaging;

  static const String fcmTokenKey = 'fcmToken';

  Future<PushMessagingService> init() async {
    try {
      await setupMessaging();
    } catch (e) {
      // ignore: avoid_print
      print('Error initializing Firebase Push Messaging: $e');
    }
    return this;
  }

  Future<void> setupMessaging() async {
    messaging = FirebaseMessaging.instance;

    final token = await messaging.getToken();
    getIt<LocalDatabase>().setString(fcmTokenKey, token);

    final notificationSettings = await messaging.requestPermission();
    if (notificationSettings.authorizationStatus != AuthorizationStatus.authorized) {
      return;
    }
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

}

