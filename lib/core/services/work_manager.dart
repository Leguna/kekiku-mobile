import 'package:workmanager/workmanager.dart';

import '../../app_setup.dart';
import '../configs.dart';
import '../index.dart';
import 'notification_service.dart';

const String weekLogin = 'weekLogin';
const String scheduleNotificationKey = 'scheduleNotificationKey';

@pragma('vm:entry-point')
Future<void> callbackDispatcher() async {
  Workmanager().executeTask((task, inputData) async {
    try {
      switch (task) {
        case weekLogin:
          return await sendWeekNotification();
      }
      return Future.value(true);
    } catch (e) {
      return Future.value(true);
    }
  });
}

Future<bool> sendWeekNotification() async {
  try {
    await setupServices();
    final lastLogin = await LocalDatabase().getString(lastLoginKey);
    final isShow = await LocalDatabase().getBool(otherNotificationKey) ?? true;
    if (!isShow) return Future.value(true);
    if (lastLogin == null || lastLogin.isEmpty) return Future.value(true);
    final date = DateTime.parse(lastLogin);
    final now = DateTime.now();
    final diff = now.difference(date).inDays;
    if (diff < Config.reminderDelayInDays) return Future.value(true);
    showWeeklyNotification(
      title: Strings.reminder,
      body: Strings.weeklyReminder,
    );
    return Future.value(true);
  } catch (e) {
    return Future.value(true);
  }
}

Future<void> setWeeklyNotification(
  workManager, {
  bool isEnable = true,
}) async {
  workManager.cancelByUniqueName(weekLogin);
  if (isEnable) {
    await workManager.registerPeriodicTask(
      weekLogin,
      weekLogin,
      initialDelay: const Duration(days: Config.reminderDelayInDays),
      frequency: const Duration(days: Config.reminderDelayInDays),
    );
  }
}

class WeekNotification {
  final Workmanager workManager;

  WeekNotification(this.workManager);

  init() async {
    final isShow = await getIt<LocalDatabase>().getBool(otherNotificationKey);
    await setWeeklyNotification(workManager, isEnable: isShow ?? true);
  }
}

class ScheduleNotification {
  final Workmanager workManager;

  ScheduleNotification(this.workManager);

  init() async {
    final isShow = await getIt<LocalDatabase>().getBool(scheduleNotificationKey);
    await setWeeklyNotification(workManager, isEnable: isShow ?? true);
  }
}