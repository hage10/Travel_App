import 'package:flutter/material.dart';
import 'package:travel_app/representations/screens/user/notifications/item_notifications_widget.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';
import 'package:travel_app/representations/widgets/customize/dashline_widget.dart';

import '../../../../core/constants/dismesion_constant.dart';
import '../../../../core/helpers/page_route_helper.dart';
import '../../../../data/models/notification_model.dart';
import 'add_meesage_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static const String routeName = "/notification_screen";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        titleString: "Thông báo hệ thống",
        child: Container(
          padding: const EdgeInsets.all(kItemPadding),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Column(
                  children: notifications.reversed
                      .map((e) => Column(
                            children: [
                              ItemNotificationWidget(notification: e),
                              const DashlineWidget()
                            ],
                          ))
                      .toList(),
                ),
                ButtonWidget(
                  title: "Tạo thông báo",
                  onTap: () async {
                    final rs = await Navigator.of(context).push(
                      CustomPageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const AddMessagePage(),
                      ),
                    );
                    if (rs == true) {
                      setState(() {
                        _scrollController.animateTo(
                          0.0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                        );
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
