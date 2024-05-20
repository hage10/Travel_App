import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:travel_app/data/models/property_type_model.dart';
import 'package:travel_app/representations/screens/sort_by_screen.dart';
import '../../core/constants/dismesion_constant.dart';
import '../../core/constants/textstyle_constants.dart';
import '../widgets/app_bar_container.dart';
import '../widgets/customize/button_widget.dart';
import '../widgets/forms/item_row_checkbox.dart';

class PropertyTypeScreen extends StatefulWidget {
  const PropertyTypeScreen({super.key});
  static const String routeName = '/property_type_screen';

  @override
  State<PropertyTypeScreen> createState() => _PropertyTypeScreenState();
}

class _PropertyTypeScreenState extends State<PropertyTypeScreen> {
  List<PropertyTypeModel> listPropertyType = [
    PropertyTypeModel('Hostels', false),
    PropertyTypeModel('Resorts', false),
    PropertyTypeModel('Hotels', false),
    PropertyTypeModel('Villas', false),
    PropertyTypeModel('Guest Houses', false),
    PropertyTypeModel('Homestays', false),
    PropertyTypeModel('Apartments', false),
    PropertyTypeModel('Others', false),
  ];

  void handleSelectAll() {
    setState(() {
      // Đặt trạng thái "Select All" thành true cho tất cả các mục
      for (var item in listPropertyType) {
        item.checked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementLeading: true,
      paddingContent: const EdgeInsets.symmetric(horizontal: 45),
      titleString: "Property Type",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: kBottomBarIconSize * 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: handleSelectAll,
                    child: Text(
                      "Select All",
                      style: TextStyles.defaultStyle
                          .setTextSize(12)
                          .primaryTextColor
                          .bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Column(
                children: listPropertyType.asMap().entries.map((entry) {
                  final index = entry.key;
                  final facility = entry.value;

                  return GestureDetector(
                    child: ItemRowCheckBoxWidget(
                      title: facility.name,
                      checked: listPropertyType[index].checked,
                      onChanged: (value) {
                        setState(() {
                          listPropertyType[index].checked = value;
                        });
                      },
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          ButtonWidget(
            title: "Done",
            onTap: () {
              Navigator.of(context).pushNamed(SortByScreen.routeName);
              toastification.show(
                context: context, // optional if you use ToastificationWrapper
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: listPropertyType
                        .map((e) => Text('${e.name}-${e.checked}'))
                        .toList()),
                autoCloseDuration: const Duration(seconds: 3),
              );
            },
          )
        ],
      ),
    );
  }
}
