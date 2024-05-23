import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import 'package:travel_app/representations/screens/auth/forgot_password_screen.dart';
import 'package:travel_app/representations/screens/auth/login_screen.dart';
import 'package:travel_app/representations/screens/auth/sign_up_screen.dart';
import 'package:travel_app/representations/screens/check_out_screen.dart';
import 'package:travel_app/representations/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/representations/screens/hotel_booking_screen.dart';
import 'package:travel_app/representations/screens/hotels_screen.dart';
import 'package:travel_app/representations/screens/intro_screen.dart';
import 'package:travel_app/representations/screens/main_app.dart';
import 'package:travel_app/representations/screens/property_type_screen.dart';
import 'package:travel_app/representations/screens/select_date_screen.dart';
import 'package:travel_app/representations/screens/select_room_screen.dart';
import 'package:travel_app/representations/screens/sort_by_screen.dart';
import 'package:travel_app/representations/screens/splash_screen.dart';
import 'package:travel_app/representations/screens/user/location/location_screen.dart';
import 'package:travel_app/representations/screens/user/notifications/notifications.dart';
import 'package:travel_app/representations/screens/user/profile_screen.dart';

import 'representations/screens/facilities_screen.dart';
import 'representations/screens/hotel_detail_screen.dart';
import 'representations/screens/user/contacts/contacts_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomBookingScreen.routeName: (context) =>
      const GuestAndRoomBookingScreen(),
  HotelsScreen.routeName: (context) => const HotelsScreen(),
  SelectRoomScreen.routeName: (context) => SelectRoomScreen(),
  CheckOutScreen.routeName: (context) => const CheckOutScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgotPasswordCsreen.routeName: (context) => const ForgotPasswordCsreen(),
  FacilitiesScreen.routeName: (context) => const FacilitiesScreen(),
  PropertyTypeScreen.routeName: (context) => const PropertyTypeScreen(),
  SortByScreen.routeName: (context) => const SortByScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  ContactsScreen.routeName: (context) => const ContactsScreen(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  // LocationScreen.routeName: (context) => const LocationScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          final HotelModel hotelModel = (settings.arguments as HotelModel);
          return HotelDetailScreen(hotelModel: hotelModel);
        },
      );
  }
  return null;
}
