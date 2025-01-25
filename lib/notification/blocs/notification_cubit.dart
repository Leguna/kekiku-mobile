import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekiku/notification/models/notification_mdl.dart';

import '../../core/index.dart';
import '../data_sources/notification_repository.dart';

part 'notification_cubit.freezed.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState.initial()) {
    loadNotifications();
  }

  final NotificationRepository _notificationRepository =
      getIt<NotificationRepository>();

  List<NotificationMdl> notifications = [];

  Future<void> loadNotifications() async {
    try {
      emit(const NotificationState.loading());
      await Future.delayed(const Duration(seconds: 1));
      notifications = await _notificationRepository.getNotifications();
      emit(NotificationState.loaded(notifications));
    } catch (e) {
      emit(NotificationState.error(e.toString()));
    }
  }
}
