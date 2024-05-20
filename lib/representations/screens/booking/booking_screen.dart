// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:travel_app/core/constants/dismesion_constant.dart';
// import 'package:travel_app/core/constants/textstyle_constants.dart';

// import '../../widgets/app_bar_container.dart';
// import 'booking_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/dismesion_constant.dart';
import '../../../core/constants/textstyle_constants.dart';
import 'booking_controller.dart'; // Import Get package

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Center(
        child: GetX<BookingController>(
          init: BookingController(), // Initialize the controller
          builder: (controller) {
            if (controller.products.isEmpty) {
              return const Text(
                  'No products found'); // Display a message if no products are available
            } else if (controller.products == RxStatus.loading) {
              return const CircularProgressIndicator(); // Show a loading indicator while fetching data
            } else if (controller.products == RxStatus.error) {
              return Text(
                  'Error: ${controller.products}'); // Display an error message if fetching fails
            } else {
              // Display the user data
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: kItemPadding),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(kItemPadding))),
                      child: ListTile(
                        trailing: InkWell(
                          child: const Icon(Icons.other_houses),
                          onTap: () {},
                        ),
                        contentPadding:
                            const EdgeInsets.only(left: 24, right: 24),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: FadeInImage.assetNetwork(
                              placeholder: 'assets/music.png',
                              image: product.thumbnail!,
                              width: 48,
                              height: 48,
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  "assets/music.png",
                                  width: 48,
                                  height: 48,
                                );
                              }),
                        ),
                        title: Text(product.title!),
                        subtitle: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          product.description!,
                          style: TextStyles.defaultStyle.subTitleTextColor
                              .setTextSize(12),
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}

// class BookingScreen extends GetView<BookingController> {
//   const BookingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBarContainerWidget(
//       title: Text(
//         "Booking Screen",
//         style: TextStyles.defaultStyle.whiteTextColor.bold.setTextSize(30),
//       ),
//       child: Center(
//         child: GetX<BookingController>(
//           init: BookingController(), // Initialize the controller
//           builder: (controller) {
//             if (controller.products.isEmpty) {
//               return const Text(
//                   'No products found'); // Display a message if no products are available
//             } else {
//               // Display the user data
//               return ListView.builder(
//                 itemCount: controller.products.length,
//                 itemBuilder: (context, index) {
//                   final product = controller.products[index];
//                   return Container(
//                     margin: const EdgeInsets.only(bottom: kItemPadding),
//                     decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius:
//                             BorderRadius.all(Radius.circular(kItemPadding))),
//                     child: ListTile(
//                       trailing: InkWell(
//                         child: const Icon(Icons.other_houses),
//                         onTap: () {},
//                       ),
//                       contentPadding:
//                           const EdgeInsets.only(left: 24, right: 24),
//                       leading: ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: FadeInImage.assetNetwork(
//                             placeholder: 'assets/music.png',
//                             image: product.thumbnail!,
//                             width: 48,
//                             height: 48,
//                             imageErrorBuilder: (context, error, stackTrace) {
//                               return Image.asset(
//                                 "assets/music.png",
//                                 width: 48,
//                                 height: 48,
//                               );
//                             }),
//                       ),
//                       title: Text(product.title!),
//                       subtitle: Text(
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                         product.description!,
//                         style: TextStyles.defaultStyle.subTitleTextColor
//                             .setTextSize(12),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
