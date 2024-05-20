import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/colors_contants.dart';

enum CheckboxShape { square, rounded }

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    super.key,
    required this.onChanged,
    this.activeColor = Colors.white,
    this.checkColor = ColorPalette.primaryColor,
    required this.initialValue,
  });

  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? checkColor;
  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  late bool _isChecked;
  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Transform.scale(
        scale: 1.3,
        child: Checkbox(
          visualDensity: VisualDensity.comfortable,
          checkColor: ColorPalette.primaryColor,
          activeColor: widget.activeColor,
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(width: 0, color: Colors.transparent),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (!states.contains(MaterialState.selected)) {
              return widget.activeColor;
            }
            return null;
          }),
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
              widget.onChanged(value);
            });
          },
        ),
      );
    });
  }
}
