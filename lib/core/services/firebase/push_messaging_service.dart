import 'package:firebase_messaging/firebase_messaging.dart';

import '../../index.dart';
import '../notification_service.dart';

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
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await setupForegroundMessageHandler();
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  setupForegroundMessageHandler() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showChatNotification(
        id: message.hashCode,
        body: message.notification?.body,
        title: message.notification?.title,
      );
    });
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  showChatNotification(
    id: message.hashCode,
    body: message.notification?.body,
    title: message.notification?.title,
  );
}
