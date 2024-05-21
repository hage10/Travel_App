import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_app/core/constants/colors_contants.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/constants/textstyle_constants.dart';
import 'package:travel_app/representations/screens/user/avatar_picker.dart';
import 'package:travel_app/representations/screens/user/contacts/contacts_screen.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';
import 'package:travel_app/representations/widgets/customize/dashline_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = '/profile_screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        title: Text(
          'Profile',
          style: TextStyles.defaultStyle.bold.whiteTextColor.setTextSize(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const AvatarPicker(),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      "Trịnh Quang Trung",
                      style: TextStyles.defaultStyle.setTextSize(20),
                    ),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.logout_outlined),
                        label: const Text("Đăng xuất"))
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            const Text("Bảo mật ứng dụng"),
            const SizedBox(
              height: kMinPadding,
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(kMinPadding))),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: ColorPalette.primaryColor,
                      ),
                      SizedBox(width: kDefaultPadding),
                      Text("Thông tin cá nhân")
                    ],
                  ),
                  const DashlineWidget(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ContactsScreen.routeName);
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.contact_emergency_outlined,
                          color: ColorPalette.primaryColor,
                        ),
                        SizedBox(width: kDefaultPadding),
                        Text("Danh bạ")
                      ],
                    ),
                  ),
                  const DashlineWidget(),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: ColorPalette.primaryColor,
                      ),
                      SizedBox(width: kDefaultPadding),
                      Text("Vị trí")
                    ],
                  ),
                  const DashlineWidget(),
                  const Row(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: ColorPalette.primaryColor,
                      ),
                      SizedBox(width: kDefaultPadding),
                      Text("Thông báo")
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
