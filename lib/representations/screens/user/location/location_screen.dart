// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:travel_app/representations/widgets/app_bar_container.dart';
// import 'package:travel_app/representations/widgets/customize/button_widget.dart';

// class LocationScreen extends StatefulWidget {
//   const LocationScreen({super.key});
//   static const String routeName = '/location_screen';
//   @override
//   State<LocationScreen> createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   Position? _position;
//   void _getCurrentLocation() async {
//     Position position = await _determinePosition();
//     setState(() {
//       _position = position;
//     });
//   }

//   Future<Position> _determinePosition() async {
//     LocationPermission permission;
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
// // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppBarContainerWidget(
//       // title: const Text("vị trí"),
//       titleString: "Vị trí",
//       child: Column(
//         children: [
//           Center(
//             child: _position != null
//                 ? Text('Current Location: $_position')
//                 : const Text('No location data'),
//           ),
//           ButtonWidget(
//             title: "Increment",
//             onTap: () {
//               _getCurrentLocation;
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
