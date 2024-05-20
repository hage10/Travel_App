import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/data/models/room_model.dart';
import 'package:travel_app/representations/screens/check_out_screen.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';
import 'package:travel_app/representations/widgets/item_utility_hotel_widget.dart';

import '../widgets/item_room_booking_widget.dart';

class SelectRoomScreen extends StatelessWidget {
  SelectRoomScreen({super.key});

  static const String routeName = '/select_room_screen';

  final List<RoomModel> listRoom = [
    RoomModel(
        roomImage: AssetHelper.room1,
        roomName: 'Deluxe Room',
        roomUtility: 'Free Cancellation',
        size: 27,
        price: 245),
    RoomModel(
        roomImage: AssetHelper.room2,
        roomName: 'Executive Suite',
        roomUtility: 'Non-refundable',
        size: 32,
        price: 245),
    RoomModel(
        roomImage: AssetHelper.room3,
        roomName: 'King Bed Only Room',
        roomUtility: 'Non-refundable',
        size: 24,
        price: 14),
  ];
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Select room',
      implementLeading: true,
      implementTrailing: true,
      child: SingleChildScrollView(
        child: Column(
          children: listRoom
              .map(
                (e) => ItemRoomBookingWidget(
                    roomImage: e.roomImage,
                    roomName: e.roomName,
                    roomPrice: e.price,
                    roomSize: e.size,
                    roomUtility: e.roomUtility,
                    onTap: () {
                      Navigator.of(context).pushNamed(CheckOutScreen.routeName);
                    }),
              )
              .toList(),
        ),
      ),
    );
  }
}
