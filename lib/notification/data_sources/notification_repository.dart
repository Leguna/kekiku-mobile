import 'package:kekiku/notification/data_sources/notification_local_source.dart';

import '../models/notification_mdl.dart';

class NotificationRepository {
  final NotificationLocalSource _notificationLocalSource;

  NotificationRepository(this._notificationLocalSource);

  Future<List<NotificationMdl>> getNotifications() async {
    final jsonString = await _notificationLocalSource.getNotifications();
    final List<NotificationMdl> notifications =
        notificationFromJson(jsonString);
    return notifications;
  }
}
