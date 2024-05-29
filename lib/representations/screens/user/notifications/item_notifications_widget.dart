import 'package:flutter/material.dart';
import '../../../../core/extensions/date_ext.dart';
import '../../../../core/helpers/page_route_helper.dart';
import '../../../../data/models/notification_model.dart';
import 'detail_notification_screen.dart';

class ItemNotificationWidget extends StatefulWidget {
  const ItemNotificationWidget({super.key, required this.notification});
  final NotificationModel notification;

  @override
  State<ItemNotificationWidget> createState() => _ItemNotificationWidgetState();
}

class _ItemNotificationWidgetState extends State<ItemNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.of(context).push(
          CustomPageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                DetailNotificationScreen(
              notification: widget.notification,
            ),
          ),
        );
        if (result == true) {
          setState(() {});
        }
      },
      child: Dismissible(
        key: Key(widget.notification.code),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10))),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (!widget.notification.seen)
                            Container(
                              margin: const EdgeInsets.only(right: 4),
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  color: Colors.blue[200],
                                  shape: BoxShape.circle),
                            ),
                          Expanded(
                            child: Text(
                              widget.notification.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Text(
                          //   "${widget.notification.dateTime.hour}:${widget.notification.dateTime.minute}",
                          // ),
                          Text(widget.notification.dateTime.getDateTime)
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.notification.body,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 48,
                width: 48,
                child: widget.notification.image == null
                    ? Image.network(
                        "https://via.placeholder.com/150/808080/000000?text=NotificationModel10")
                    : Image.file(widget.notification.image!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
