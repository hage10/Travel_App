import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:travel_app/core/constants/textstyle_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representations/screens/property_type_screen.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';
import 'package:travel_app/representations/widgets/forms/item_row_checkbox.dart';

import '../../core/constants/dismesion_constant.dart';
import '../../data/models/facility_model.dart';
import '../widgets/app_bar_container.dart';

class FacilitiesScreen extends StatefulWidget {
  const FacilitiesScreen({super.key});
  static const String routeName = '/facilities_screen';

  @override
  State<FacilitiesScreen> createState() => _FacilitiesScreenState();
}

class _FacilitiesScreenState extends State<FacilitiesScreen> {
  List<FacilityModel> listFacilites = [
    FacilityModel("Wifi", AssetHelper.icoWifi, false),
    FacilityModel("Digital TV", AssetHelper.icoDigitalTv, false),
    FacilityModel("Parking Area", AssetHelper.icoParking, false),
    FacilityModel("Swimming Pool", AssetHelper.icoPool, false),
    FacilityModel("Curency Exchange", AssetHelper.icoCurrency, false),
    FacilityModel("Restaurant", AssetHelper.icoRestaurant, false),
    FacilityModel("Car Rental", AssetHelper.icoCarRentral, false),
    FacilityModel("24-hour Front Desk", AssetHelper.icoReception, false),
  ];

  void handleSelectAll() {
    setState(() {
      // Đặt trạng thái "Select All" thành true cho tất cả các mục
      for (var facility in listFacilites) {
        facility.checked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      // title: const Text(
      //   "Facilities",
      //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      // ),
      titleString: 'Facilities',
      implementLeading: true,

      paddingContent: const EdgeInsets.symmetric(horizontal: 45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: kBottomBarIconSize * 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: handleSelectAll,
                    child: Text(
                      "Select All",
                      style: TextStyles.defaultStyle
                          .setTextSize(12)
                          .primaryTextColor
                          .bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Column(
                children: listFacilites.asMap().entries.map((entry) {
                  final index = entry.key;
                  final facility = entry.value;

                  return GestureDetector(
                    child: ItemRowCheckBoxWidget(
                      icon: facility.facilityIcon,
                      title: facility.facilityName,
                      checked: listFacilites[index].checked,
                      onChanged: (value) {
                        setState(() {
                          listFacilites[index].checked = value;
                        });
                      },
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          ButtonWidget(
            title: "Done",
            onTap: () {
              Navigator.of(context).pushNamed(PropertyTypeScreen.routeName);
              toastification.show(
                context: context, // optional if you use ToastificationWrapper
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: listFacilites
                        .map((e) => Text('${e.facilityName}-${e.checked}'))
                        .toList()),
                autoCloseDuration: const Duration(seconds: 3),
              );
            },
          )
        ],
      ),
    );
  }
}
