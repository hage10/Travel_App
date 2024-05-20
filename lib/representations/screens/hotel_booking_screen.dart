import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/extensions/date_ext.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representations/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/representations/screens/hotels_screen.dart';
import 'package:travel_app/representations/screens/select_date_screen.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';
import 'package:travel_app/representations/widgets/item_booking_wiget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key});
  static const String routeName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
  String? guestAndRoomSelected;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementLeading: true,
      titleString: "Hotel booking",
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            const ItemBookingWidget(
              icon: AssetHelper.icoLocation,
              title: "Destination",
              description: "South Korea",
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            StatefulBuilder(builder: (context, setState) {
              return ItemBookingWidget(
                onTap: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(SelectDateScreen.routeName);
                  if (!(result as List<DateTime?>)
                      .any((element) => element == null)) {
                    dateSelected =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                    setState(() {});
                  }
                },
                icon: AssetHelper.icoCalendal,
                title: "Select Date",
                description: dateSelected ?? "13 Feb - 18 Feb 2021",
              );
            }),
            const SizedBox(
              height: kMediumPadding,
            ),
            StatefulBuilder(builder: (context, setState) {
              return ItemBookingWidget(
                icon: AssetHelper.icoBed,
                title: "Guest and Room",
                description: guestAndRoomSelected ?? "2 Guest, 1 Room",
                onTap: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(GuestAndRoomBookingScreen.routeName);
                  if (!(result as List<int?>)
                      .any((element) => element == null)) {
                    guestAndRoomSelected =
                        '${result[0]} Guest, ${result[1]} Room';
                    setState(() {});
                  }
                },
              );
            }),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Search',
              onTap: () {
                Navigator.of(context).pushNamed(HotelsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
