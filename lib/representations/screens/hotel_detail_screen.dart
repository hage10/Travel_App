import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/colors_contants.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import 'package:travel_app/representations/screens/select_room_screen.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';
import 'package:travel_app/representations/widgets/customize/dashline_widget.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key, required this.hotelModel});
  static const routeName = '/hotel_detail_screen';
  final HotelModel hotelModel;
  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(AssetHelper.hotelScreen,
                fit: BoxFit.fill),
          ),
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(kItemPadding),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDefaultPadding))),
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 18,
                ),
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(kItemPadding),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDefaultPadding))),
                child: const Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 18,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            minChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding),
                    topRight: Radius.circular(kDefaultPadding),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kItemPadding),
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Expanded(
                        child: ListView(
                      controller: scrollController,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.hotelModel.hotelName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Spacer(),
                            Text(
                              '\$${widget.hotelModel.price}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text("/night"),
                          ],
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        Row(
                          children: [
                            ImageHelper.loadFromAsset(
                                AssetHelper.icoLocationBlank),
                            const SizedBox(
                              width: kMinPadding,
                            ),
                            Text(widget.hotelModel.location),
                          ],
                        ),
                        const DashlineWidget(),
                        Row(
                          children: [
                            ImageHelper.loadFromAsset(AssetHelper.icoStar),
                            const SizedBox(
                              width: kMinPadding,
                            ),
                            Text('${widget.hotelModel.star}/5'),
                            Text(
                              '(${widget.hotelModel.numOfReview})',
                              style: const TextStyle(
                                  color: ColorPalette.subTitleColor),
                            ),
                          ],
                        ),
                        const DashlineWidget(),
                        const Text(
                          'Infomariton',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const Text(
                            '''You will find every comfort because many of the 
services that the hotel offers for travellers and of 
course the hotel is very comfortable.'''),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const Text(
                          'Location',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const Text(
                            '''Located in the famous neighborhood of Seoul, 
Grand Luxury’s is set in a building built in the 
2010s.'''),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        ImageHelper.loadFromAsset(AssetHelper.imageMap),
                        const SizedBox(
                          height: kDefaultPadding * 2,
                        ),
                        ButtonWidget(
                          title: "Select Room",
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(SelectRoomScreen.routeName);
                          },
                        )
                      ],
                    ))
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
