import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:travel_app/representations/widgets/forms/form_radio_with_label.dart';
import '../../core/constants/dismesion_constant.dart';
import '../widgets/app_bar_container.dart';
import '../widgets/customize/button_widget.dart';

class SortByScreen extends StatefulWidget {
  const SortByScreen({super.key});
  static const String routeName = '/sort_by_screen';

  @override
  State<SortByScreen> createState() => _SortByScreenState();
}

class _SortByScreenState extends State<SortByScreen> {
  String selectedSortOption = 'Highest popularity'; // Giá trị mặc định
  int layoutButtonTrigger = 1;
  late final ValueNotifier<int> _groupValue = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      // title: const Text(
      //   "Facilities",
      //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      // ),
      titleString: 'Sort By',
      implementLeading: true,

      paddingContent: const EdgeInsets.symmetric(horizontal: 45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: kBottomBarIconSize * 3,
              ),
              Column(
                children: [
                  FormRadioWithLabel(
                    notifier: _groupValue,
                    index: 0,
                    title: 'Highest popularity',
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  FormRadioWithLabel(
                    notifier: _groupValue,
                    index: 1,
                    title: 'Lowest Price',
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  FormRadioWithLabel(
                    notifier: _groupValue,
                    index: 2,
                    title: 'Highest Price',
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  FormRadioWithLabel(
                    notifier: _groupValue,
                    index: 3,
                    title: 'Highest Rating',
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  FormRadioWithLabel(
                    notifier: _groupValue,
                    index: 4,
                    title: 'Nearest Distance',
                  ),
                ],
              ),
            ],
          ),
          ButtonWidget(
            title: "Apply",
            onTap: () {
              toastification.show(
                context: context, // optional if you use ToastificationWrapper
                title: Text(_groupValue.toString()),
                autoCloseDuration: const Duration(seconds: 3),
              );
            },
          )
        ],
      ),
    );
  }
}
