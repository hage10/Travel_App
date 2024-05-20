import 'package:flutter/material.dart';
import 'package:travel_app/representations/widgets/customize/radio_widget.dart';
import '../../../core/constants/colors_contants.dart';

class FormRadioWithLabel extends StatelessWidget {
  final String title;
  final ValueNotifier<int> notifier;
  final int index;
  final Color? activeColor;
  final Color? checkColor;

  const FormRadioWithLabel({
    super.key,
    required this.title,
    required this.notifier,
    required this.index,
    this.activeColor = Colors.white,
    this.checkColor = ColorPalette.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          ValueListenableBuilder(
            valueListenable: notifier,
            builder: (BuildContext context, _, __) {
              return Theme(
                data: ThemeData(
                  //here change to your color
                  unselectedWidgetColor: Colors.white,
                ),
                child: RadioWidget(
                  value: notifier.value,
                  groupValue: index,
                  onChanged: (p0) {
                    notifier.value = index;
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
