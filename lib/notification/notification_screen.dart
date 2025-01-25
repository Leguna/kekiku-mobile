import 'package:kekiku/notification/blocs/notification_cubit.dart';

import '../core/index.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationCubit>();
    return MyScaffold(
      appBar: const MyAppBar(title: Text('Notifications')),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<NotificationCubit>().loadNotifications();
            },
            child: cubit.notifications.isEmpty
                ? const Center(child: Text('No notifications'))
                : ListView.builder(
                    itemCount: cubit.notifications.length,
                    itemBuilder: (context, index) {
                      final notification = cubit.notifications[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        title: Text(notification.title ?? ''),
                        subtitle: Text(notification.body ?? ''),
                        trailing: Text(
                          notification.timestamp?.toDateString() ?? '',
                          textAlign: TextAlign.end,
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
