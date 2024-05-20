import 'package:flutter/material.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});
  static const String routeName = '/check_out_screen';
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementLeading: true,
      implementTrailing: true,
      titleString: 'Check Out',
      child: Container(),
    );
  }
}
