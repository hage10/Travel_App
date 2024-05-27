import 'package:flutter/material.dart';
import 'package:travel_app/representations/screens/user/notifications/notification_controller.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';

class LocalNotification extends StatefulWidget {
  const LocalNotification({super.key});
  static const String routeName = '/notification';

  @override
  _LocalNotificationState createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  @override
  void initState() {
    super.initState();
    NotificationController.startListeningNotificationEvents();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Flutter Local Notifications',
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            FloatingActionButton(
              heroTag: '1',
              onPressed: () => NotificationController.createNewNotification(
                  msg:
                      'A small step for a man, but a giant leap to Flutter\'s community!',
                  title: "Huston! The eagle has landed!",
                  username: 'trung',
                  channel: 'alerts',
                  heroThumbUrl:
                      'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png'),
              tooltip: 'Create New notification',
              child: const Icon(Icons.outgoing_mail),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () => NotificationController.scheduleNewNotification(
                  msg:
                      'A small step for a man, but a giant leap to Flutter\'s community!',
                  title: "Đây là thông báo được hẹn",
                  username: 'trung',
                  hoursFromNow: 60,
                  channel: 'alerts',
                  heroThumbUrl:
                      'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png'),
              tooltip: 'Schedule New notification',
              child: const Icon(Icons.access_time_outlined),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: '3',
              onPressed: () => NotificationController.resetBadgeCounter(),
              tooltip: 'Reset badge counter',
              child: const Icon(Icons.exposure_zero),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: '4',
              onPressed: () => NotificationController.cancelNotifications(),
              tooltip: 'Cancel all notifications',
              child: const Icon(Icons.delete_forever),
            ),
          ],
        ),
      ),
    );
  }
}
