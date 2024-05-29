import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representations/screens/auth/forgot_password_screen.dart';
import 'package:travel_app/representations/screens/auth/sign_up_screen.dart';
import 'package:travel_app/representations/screens/main_app.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';
import 'package:travel_app/representations/widgets/forms/form_checkbox.dart';
import '../../../core/constants/textstyle_constants.dart';
import '../../../core/helpers/page_route_helper.dart';
import '../../../data/network/api/auth_api.dart';
import '../../../data/network/bloc/login_bloc.dart';
import '../../../data/network/service/auth_service.dart';
import '../../widgets/forms/form_input_with _label.dart';
import '../../widgets/customize/solid_line_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: "eve.holt@reqres.in");
  final TextEditingController _passController = TextEditingController();
  bool isLoading = false;
  bool remember = false;
  // final FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    final authRepository = AuthRepository();
    final authService = AuthService(authRepository: authRepository);
    _loginBloc = LoginBloc(authService: authService);

    _loginBloc.loginStream.listen((status) {
      setState(() {
        isLoading = false;
      });

      if (status == true) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MainApp(), // Điều hướng đến HomeScreen
        ));
      } else {
        toastification.show(
          primaryColor: Colors.red,
          context: context, // optional if you use ToastificationWrapper
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Thất bại!"),
            ],
          ),
          description: Text(
            status,
            style: const TextStyle(color: Colors.black),
          ),

          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _loginBloc.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      _loginBloc.login(_emailController.text, _passController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: "Login",
      subTitleString: "Hi, Welcome back!",
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: kBottomBarIconSize * 3,
              ),
              LabelledFormInput(
                  // validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  label: "Email"),
              const SizedBox(
                height: kDefaultPadding * 2,
              ),
              LabelledFormInput(
                  placeholder: "Password",
                  obscureText: true,
                  // validator: (value) =>
                  // validateRequiredField(value, 'Password'),
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passController,
                  label: "Password"),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: kMinPadding,
                        ),
                        CheckBoxWidget(
                          initialValue: false,
                          onChanged: (value) {},
                        ),
                        const Text("Remember me")
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(CustomPageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const ForgotPasswordCsreen(),
                      ));
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyles.defaultStyle.primaryTextColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              ButtonWidget(
                title: "Login",
                isLoading: isLoading,
                onTap: _login,
                // onTap: () async {
                // if (_formKey.currentState!.validate()) {
                //   setState(() {
                //     isLoading = true;
                //   });
                //   await Future.delayed(const Duration(seconds: 2));
                //   isLoading = false;
                //   Navigator.of(context)
                //       .pushReplacementNamed(MainApp.routeName);
                //   toastification.show(
                //     context:
                //         context, // optional if you use ToastificationWrapper
                //     title: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text('Email: ${_emailController.text}'),
                //         Text('Password: ${_passController.text}'),
                //       ],
                //     ),
                //     autoCloseDuration: const Duration(seconds: 3),
                //   );
                // }
                // },
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              const SolidLineTextWidget(
                label: 'or log in with',
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kMediumPadding,
                          vertical: kDefaultFontSize),
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
                          horizontal: kMediumPadding,
                          vertical: kDefaultFontSize),
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
              const SizedBox(
                height: kMediumPadding,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    TextSpan(
                        text: " Sign up",
                        style: TextStyles.defaultStyle.primaryTextColor.bold,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(CustomPageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const SignUpScreen(),
                            ));
                          }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
