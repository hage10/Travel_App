import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/dismesion_constant.dart';

class FormPhoneInputWithLabel extends StatelessWidget {
  const FormPhoneInputWithLabel(
      {super.key,
      required this.controller,
      required this.label,
      this.required = false});

  final TextEditingController controller;
  final String label;
  final bool? required;

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
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: ColorPalette.subTitleColor, fontSize: 12),
          ),
          IntlPhoneField(
            controller: controller,
            disableLengthCheck: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              fillColor: Colors.white,
              filled: true,
              // hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(kItemPadding),
              ),
              // labelText: 'Số điện thoại',
            ),
            initialCountryCode: 'VN', // Mã quốc gia mặc định (ví dụ: Việt Nam)
            onChanged: (phone) {
              print(phone.completeNumber); // Xử lý khi số điện thoại thay đổi
            },
          ),
        ],
      ),
    );
  }
}
