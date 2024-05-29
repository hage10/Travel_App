import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_app/core/constants/colors_contants.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/representations/screens/home_screen.dart';
import 'package:travel_app/representations/screens/user/profile_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  static const routeName = 'main_app';
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeScreen(),
          Container(color: Colors.blue),
          Container(color: Colors.blue),
          // const BookingScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        margin: const EdgeInsets.symmetric(
            vertical: kMediumPadding, horizontal: kMediumPadding),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.home,
              size: kDefaultIconSize,
            ),
            title: const Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.favorite,
              size: kDefaultIconSize,
            ),
            title: const Text("Likes"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.book,
              size: kDefaultIconSize,
            ),
            title: const Text("Booking"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.person,
              size: kDefaultIconSize,
            ),
            title: const Text("Profile"),
          ),
        ],
      ),
    );
  }
}
