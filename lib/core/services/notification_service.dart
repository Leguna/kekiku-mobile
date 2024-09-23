import 'package:flutter_local_notifications/flutter_local_notifications.dart';

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
late AndroidNotificationChannel mainChannel;
bool isFlutterLocalNotificationsInitialized = false;

const channel = 'app_channel_id';
const channelName = 'App Channel Notification';
const channelDescription = 'Notification for main app';

const weeklyNotificationId = 1;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  mainChannel = const AndroidNotificationChannel(
    channel,
    channelName,
    description: channelDescription,
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(mainChannel);
  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@drawable/ic_stat_favicon'),
    ),
  );

  isFlutterLocalNotificationsInitialized = true;
}


void showWeeklyNotification({
  required String title,
  required String body,
}) {
  flutterLocalNotificationsPlugin.show(
    weeklyNotificationId,
    title,
    body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        mainChannel.id,
        mainChannel.name,
        channelDescription: mainChannel.description,
        largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
        icon: '@drawable/ic_notification',
      ),
    ),
  );
}

enum NotificationType {
  none,
  weekly,
  chat,
}
