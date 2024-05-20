import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';
import 'package:travel_app/representations/widgets/customize/dashline_widget.dart';
import 'package:travel_app/representations/widgets/item_utility_hotel_widget.dart';

class ItemRoomBookingWidget extends StatelessWidget {
  const ItemRoomBookingWidget({
    super.key,
    required this.roomImage,
    required this.roomName,
    required this.roomPrice,
    required this.roomSize,
    required this.roomUtility,
    required this.onTap,
  });
  final String roomImage;
  final String roomName;
  final int roomPrice;
  final int roomSize;
  final String roomUtility;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kItemPadding),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: kMinPadding,
                  ),
                  Text('Room Size: $roomSize m2'),
                  const SizedBox(
                    height: kMinPadding,
                  ),
                  Text(roomUtility)
                ],
              ),
              const Spacer(),
              ImageHelper.loadFromAsset(roomImage,
                  radius: const BorderRadius.all(Radius.circular(kMinPadding)))
            ],
          ),
          ItemUtilityHotelWidget(),
          const DashlineWidget(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$$roomPrice',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Text('/night'),
                ],
              ),
              const Spacer(),
              Expanded(
                child: ButtonWidget(
                  title: 'Choose',
                  onTap: onTap,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
