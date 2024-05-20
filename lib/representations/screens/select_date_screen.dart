import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/core/constants/colors_contants.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';

class SelectDateScreen extends StatelessWidget {
  static const String routeName = "/select_date_screen";

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  SelectDateScreen({super.key});
  // const SelectDateScreen({super.key, this.rangeStartDate, this.rangeEndDate});

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: "Select date",
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 1.5,
          ),
          SfDateRangePicker(
            backgroundColor: ColorPalette.backgroundScaffoldColor,
            headerStyle: const DateRangePickerHeaderStyle(
              backgroundColor: ColorPalette.backgroundScaffoldColor,
            ),
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings:
                const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              } else {
                rangeStartDate = null;
                rangeEndDate = null;
              }
            },
          ),
          ButtonWidget(
            title: "Select",
            onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: "Cancel",
            onTap: () {
              Navigator.of(context).pop([null, null]);
            },
          ),
        ],
      ),
    );
  }
}
