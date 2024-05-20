// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/colors_contants.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';

class LabelledFormInput extends StatefulWidget {
  final String label;
  final String? placeholder;
  final String? value;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  bool? obscureText;

  LabelledFormInput({
    super.key,
    this.placeholder,
    required this.keyboardType,
    required this.controller,
    this.obscureText = false,
    required this.label,
    this.value,
    this.validator,
  });

  @override
  State<LabelledFormInput> createState() => _LabelledFormInputState();
}

class _LabelledFormInputState extends State<LabelledFormInput> {
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
          TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            onTap: () {},
            keyboardType: widget.keyboardType,
            //initialValue: initialValue,
            obscureText: widget.obscureText!,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              fillColor: Colors.white,
              filled: true,
              suffixIcon: widget.keyboardType == TextInputType.visiblePassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          widget.obscureText = !widget.obscureText!;
                        });
                      },
                      child: Icon(
                        !widget.obscureText!
                            ? FontAwesomeIcons.solidEye
                            : FontAwesomeIcons.solidEyeSlash,
                        size: kDefaultIconSize,
                      ))
                  : InkWell(
                      onTap: () {
                        widget.controller.text = "";
                      },
                      child: const Icon(
                        FontAwesomeIcons.timesCircle,
                        size: kDefaultIconSize,
                      ),
                    ),
              // hintText: placeholder,
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(kItemPadding),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
