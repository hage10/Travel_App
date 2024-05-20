import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/core/constants/colors_contants.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representations/widgets/forms/form_checkbox.dart';

enum CheckboxShape { square, rounded }

class ItemRowCheckBoxWidget extends StatefulWidget {
  ItemRowCheckBoxWidget({
    super.key,
    this.icon,
    required this.title,
    this.checked = false,
    required this.onChanged,
    this.shape = CheckboxShape.rounded,
  });
  final String? icon;
  final String title;
  bool? checked;
  final ValueChanged<bool> onChanged;
  final CheckboxShape? shape;

  @override
  State<ItemRowCheckBoxWidget> createState() => _ItemRowCheckBoxWidgetState();
}

class _ItemRowCheckBoxWidgetState extends State<ItemRowCheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SvgPicture.asset(
                //   AssetHelper.icoTv,
                //   width: kDefaultIconSize,
                //   height: kDefaultFontSize,
                // ),
                if (widget.icon != null)
                  ImageHelper.loadFromAsset(widget.icon!,
                      height: 24, width: 24),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                Text(widget.title),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 24,
              width: 24,
              child: Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  visualDensity: VisualDensity.comfortable,
                  checkColor: ColorPalette.primaryColor,
                  activeColor: ColorPalette.primaryColor.withOpacity(0.2),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) =>
                        const BorderSide(width: 0, color: Colors.transparent),
                  ),
                  shape: widget.shape == CheckboxShape.rounded
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )
                      : const CircleBorder(),
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (!states.contains(MaterialState.selected)) {
                      return ColorPalette.primaryColor.withOpacity(0.2);
                    }
                    return null;
                  }),
                  value: widget.checked,
                  onChanged: (value) {
                    setState(() {
                      widget.checked = value;
                      widget.onChanged(value!);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: kMediumPadding,
        )
      ],
    );
  }
}
