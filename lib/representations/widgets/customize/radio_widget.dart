import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/colors_contants.dart';

class RadioWidget extends StatefulWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;
  final Color? backgroundColor;
  final Color? activeColor;
  const RadioWidget(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.backgroundColor = ColorPalette.primaryColor,
      this.activeColor = ColorPalette.primaryColor});

  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return GestureDetector(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.backgroundColor!.withOpacity(0.2)),
        child: Icon(
          Icons.circle,
          size: 20,
          color: selected
              ? widget.activeColor
              : widget.backgroundColor!.withOpacity(0.2),
        ),
      ),
    );
  }
}
