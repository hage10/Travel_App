import 'package:flutter/material.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static const String routeName = "/notification_screen";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppBarContainerWidget(
      titleString: "Thông báo hệ thống",
      child: Column(
        children: [],
      ),
    );
  }
}
