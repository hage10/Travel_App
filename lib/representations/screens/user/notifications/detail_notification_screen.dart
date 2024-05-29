import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/core/constants/colors_contants.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/constants/textstyle_constants.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';
import 'package:travel_app/representations/widgets/customize/dashline_widget.dart';

import '../../../../data/models/notification_model.dart';

class DetailNotificationScreen extends StatelessWidget {
  const DetailNotificationScreen({super.key, required this.notification});
  final NotificationModel notification;
  @override
  void markNotificationAsSeen(int id, BuildContext context) {
    // Tìm kiếm thông báo với id tương ứng
    NotificationModel notification =
        notifications.firstWhere((element) => element.id == id);
    notification.seen = true;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: "Chi tiết thông báo",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: kDefaultPadding * 3,
          ),
          Text(
            notification.title,
            style: TextStyles.defaultStyle.bold.setTextSize(14),
          ),
          const DashlineWidget(color: ColorPalette.subTitleColor),
          const SizedBox(
            height: kMinPadding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nội dung",
                style: TextStyles.defaultStyle.subTitleTextColor,
              ),
              const SizedBox(
                width: kDefaultPadding * 5,
              ),
              Expanded(
                  child: Text(
                notification.body,
                textAlign: TextAlign.end,
              ))
            ],
          ),
          const DashlineWidget(color: ColorPalette.subTitleColor),
          Text(
            'Thông tin giao dịch',
            style: TextStyles.defaultStyle.bold.setTextSize(14),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Text(
                "Người gửi",
                style: TextStyles.defaultStyle.subTitleTextColor,
              ),
              const Spacer(),
              Text(notification.fromUser)
            ],
          ),
          const SizedBox(
            height: kMinPadding,
          ),
          Row(
            children: [
              Text(
                "Người nhận",
                style: TextStyles.defaultStyle.subTitleTextColor,
              ),
              const Spacer(),
              Text(notification.toUser)
            ],
          ),
          const SizedBox(
            height: kMinPadding,
          ),
          Row(
            children: [
              Text(
                "Mã giao dịch",
                style: TextStyles.defaultStyle.subTitleTextColor,
              ),
              const Spacer(),
              Text(notification.code)
            ],
          ),
          const SizedBox(
            height: kMinPadding,
          ),
          Row(
            children: [
              Text(
                "Thời gian giao dịch",
                style: TextStyles.defaultStyle.subTitleTextColor,
              ),
              const Spacer(),
              Text(
                "${notification.dateTime.hour}:${notification.dateTime.minute} ${notification.dateTime.day}/${notification.dateTime.month}/${notification.dateTime.year}",
              )
            ],
          ),
          const DashlineWidget(color: ColorPalette.subTitleColor),
          Text(
            'Ảnh đính kèm',
            style: TextStyles.defaultStyle.bold.setTextSize(14),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          if (notification.image != null)
            Center(child: Image.file(notification.image!)),
          const SizedBox(
            height: kDefaultPadding,
          ),
          if (!notification.seen)
            ButtonWidget(
              title: "Đánh dấu đã xem",
              onTap: () {
                markNotificationAsSeen(notification.id, context);
              },
            )
        ],
      ),
    );
  }
}
