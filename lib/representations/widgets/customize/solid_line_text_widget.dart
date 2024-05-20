import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';

class SolidLineTextWidget extends StatelessWidget {
  const SolidLineTextWidget({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Divider(thickness: 2)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(label),
        ),
        const Expanded(child: Divider(thickness: 2)),
      ],
    );
  }
}
