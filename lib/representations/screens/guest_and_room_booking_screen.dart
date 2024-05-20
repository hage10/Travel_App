import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';
import 'package:travel_app/representations/widgets/item_add_guest_and_room.dart';

class GuestAndRoomBookingScreen extends StatefulWidget {
  static const String routeName = '/guest-and-room-booking';

  const GuestAndRoomBookingScreen({super.key});
  @override
  State<GuestAndRoomBookingScreen> createState() =>
      _GuestAndRoomBookingScreenState();
}

class _GuestAndRoomBookingScreenState extends State<GuestAndRoomBookingScreen> {
  int? numOfGuest;
  int? numOfRoom;
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: "Add Guest And Room",
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 1.5,
          ),
          ItemAddGuestAndRoom(
            title: "Guest",
            icon: AssetHelper.icoGuest,
            initData: numOfGuest ?? 1,
            updateCounts: (newGuestCount) {
              setState(() {
                numOfGuest = newGuestCount;
              });
            },
          ),
          ItemAddGuestAndRoom(
            title: "Room",
            icon: AssetHelper.icoRoom,
            initData: numOfRoom ?? 1,
            updateCounts: (newRoomCount) {
              setState(() {
                numOfRoom = newRoomCount;
              });
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: "Done",
            onTap: () {
              Navigator.of(context).pop([numOfGuest ?? 1, numOfRoom ?? 1]);
            },
          )
        ],
      ),
    );
  }
}
