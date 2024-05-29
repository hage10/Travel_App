import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representations/screens/splash_screen.dart';
import 'package:travel_app/routes.dart';
import 'core/constants/colors_contants.dart';
import 'representations/screens/user/notifications/notification_controller.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  await NotificationController.initializeLocalNotifications();
  await NotificationController.initializeIsolateReceivePort();
  await NotificationController.startListeningNotificationEvents();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel App",
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      home: const SplashScreen(),
      routes: routes,
      onGenerateRoute: generateRoutes,
    );
  }
}
