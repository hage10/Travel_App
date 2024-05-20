import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      this.onTap});
  final String icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(kItemPadding),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 36,
              height: 36,
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                ),
                const SizedBox(
                  height: kMinPadding,
                ),
                Text(
                  description,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
