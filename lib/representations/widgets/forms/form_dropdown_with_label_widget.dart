import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';

import '../../../core/constants/colors_contants.dart';

class FormDropdownLabel extends StatefulWidget {
  const FormDropdownLabel(
      {super.key, required this.label, required this.items});
  final String label;
  final List<DropdownMenuItem<String>> items;

  @override
  State<FormDropdownLabel> createState() => _FormDropdownLabelState();
}

class _FormDropdownLabelState extends State<FormDropdownLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kItemPadding),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.label,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: ColorPalette.subTitleColor, fontSize: 12),
          ),
          DropdownButtonFormField(
            items: widget.items,
            onChanged: (value) {},
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(kItemPadding),
              ),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              contentPadding: const EdgeInsets.all(0),
              fillColor: Colors.white,
              filled: true,
            ),
            padding: const EdgeInsets.all(0),
          ),
        ],
      ),
    );
  }
}
