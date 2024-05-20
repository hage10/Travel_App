import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';

class ItemUtilityHotelWidget extends StatelessWidget {
  ItemUtilityHotelWidget({super.key});

  final List<Map<String, String>> listUtility = [
    {'icon': AssetHelper.icoWifi, 'name': 'Free\nWifi'},
    {'icon': AssetHelper.icoNonRefund, 'name': 'Non\nRefundable'},
    {'icon': AssetHelper.icoBreakfast, 'name': 'Free\nBreakfast'},
    {'icon': AssetHelper.icoNonSmoke, 'name': 'Non\nSmoking'},
  ];
  Widget _buildItemUtilityHotel(String icon, String title) {
    return Column(
      children: [
        Image.asset(
          icon,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUtility
            .map((e) => _buildItemUtilityHotel(e['icon']!, e['name']!))
            .toList(),
      ),
    );
  }
}
