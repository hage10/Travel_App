import 'package:flutter/material.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';

import '../../../core/constants/dismesion_constant.dart';
import '../../widgets/forms/form_input_with _label.dart';

class ForgotPasswordCsreen extends StatefulWidget {
  const ForgotPasswordCsreen({super.key});
  static const String routeName = '/forgot_password_screen';

  @override
  State<ForgotPasswordCsreen> createState() => _ForgotPasswordCsreenState();
}

class _ForgotPasswordCsreenState extends State<ForgotPasswordCsreen> {
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Forgot Password',
      subTitleString: 'You\'ll get messages on your e-mail address',
      child: Column(
        children: [
          const SizedBox(
            height: kBottomBarIconSize * 3,
          ),
          LabelledFormInput(
              keyboardType: TextInputType.text,
              controller: _passController,
              obscureText: true,
              label: "Email"),
          const SizedBox(
            height: kBottomBarIconSize,
          ),
          const ButtonWidget(title: 'Send')
        ],
      ),
    );
  }
}
