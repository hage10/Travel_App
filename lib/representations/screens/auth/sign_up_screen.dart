import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';
import 'package:travel_app/representations/widgets/forms/form_phone_input_with_label.dart';

import '../../../core/constants/textstyle_constants.dart';
import '../../../core/helpers/asset_helper.dart';
import '../../../core/helpers/image_helper.dart';
import '../../widgets/customize/button_widget.dart';
import '../../widgets/forms/form_dropdown_with_label_widget.dart';
import '../../widgets/forms/form_input_with _label.dart';
import '../../widgets/customize/solid_line_text_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String routeName = '/sign_up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  List<DropdownMenuItem<String>> get dropdownItems {
    return [
      const DropdownMenuItem(value: 'USA', child: Text('USA')),
      DropdownMenuItem(
          value: 'Canada',
          child: Text(
            'Canada',
            style: TextStyles.defaultStyle.medium.setTextSize(12),
          )),
      const DropdownMenuItem(value: 'Brazil', child: Text('Brazil')),
      const DropdownMenuItem(value: 'England', child: Text('England')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Sign up',
      subTitleString: 'Let\'s create your account! ',
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kBottomBarIconSize * 3,
            ),
            LabelledFormInput(
                keyboardType: TextInputType.text,
                controller: _nameController,
                label: "Name"),
            const SizedBox(
              height: kBottomBarIconSize,
            ),
            FormDropdownLabel(
              label: 'Country',
              items: dropdownItems,
            ),
            const SizedBox(
              height: kBottomBarIconSize,
            ),
            FormPhoneInputWithLabel(
                controller: _phoneNumberController, label: 'Phone Number'),
            const SizedBox(
              height: kBottomBarIconSize,
            ),
            LabelledFormInput(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                label: "Email"),
            const SizedBox(
              height: kBottomBarIconSize,
            ),
            LabelledFormInput(
                // placeholder: "Password",
                keyboardType: TextInputType.visiblePassword,
                controller: _passController,
                obscureText: true,
                label: "Password"),
            const SizedBox(
              height: kBottomBarIconSize,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: "By tapping sign up you agree to the",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  TextSpan(
                      text: " Terms and \nCondition",
                      style: TextStyles.defaultStyle.primaryTextColor,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context)
                              .pushNamed(SignUpScreen.routeName);
                        }),
                  const TextSpan(
                    text: " and",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  TextSpan(
                      text: " Privacy Policy ",
                      style: TextStyles.defaultStyle.primaryTextColor,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context)
                              .pushNamed(SignUpScreen.routeName);
                        }),
                  const TextSpan(
                    text: "of this app",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: "Sign Up",
              onTap: () {},
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            const SolidLineTextWidget(
              label: 'or sign up with',
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kMediumPadding, vertical: kDefaultFontSize),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMediumPadding * 2),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageHelper.loadFromAsset(
                          AssetHelper.icoGoogle,
                        ),
                        const SizedBox(
                          width: kDefaultPadding,
                        ),
                        const Text(
                          'Google',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kMediumPadding, vertical: kDefaultFontSize),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMediumPadding * 2),
                      color: const Color(0xff3C5A9A),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageHelper.loadFromAsset(
                          AssetHelper.icoFacebook,
                        ),
                        const SizedBox(
                          width: kDefaultPadding,
                        ),
                        const Text(
                          'Facebook',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
