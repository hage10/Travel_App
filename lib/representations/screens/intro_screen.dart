import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representations/screens/main_app.dart';
import 'package:travel_app/representations/widgets/customize/button_widget.dart';

import '../../core/constants/textstyle_constants.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static const routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _builderItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFromAsset(
            image,
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            padEnds: true,
            children: [
              _builderItemIntroScreen(
                  AssetHelper.intro2,
                  "Book a flight",
                  "Found a flight that matches your destination and schedule? Book it instantly.",
                  Alignment.centerRight),
              _builderItemIntroScreen(
                  AssetHelper.intro1,
                  "Find a hotel room",
                  "Select the day, book your room. We give you the best price.",
                  Alignment.center),
              _builderItemIntroScreen(
                  AssetHelper.intro3,
                  "Enjoy your trip",
                  "Easy discovering new places and share these between your friends and travel together.",
                  Alignment.centerLeft),
            ],
          ),
          Positioned(
            bottom: kMediumPadding * 3,
            left: kMediumPadding,
            right: kMediumPadding,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotHeight: kMinPadding,
                        dotWidth: kMinPadding,
                        activeDotColor: Colors.orange),
                  ),
                ),
                StreamBuilder<Object>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                        flex: 4,
                        child: ButtonWidget(
                          title: snapshot.data != 2 ? "Next" : "Get Started",
                          onTap: () {
                            if (_pageController.page != 2) {
                              _pageController.nextPage(
                                  duration: const Duration(microseconds: 200),
                                  curve: Curves.easeIn);
                            } else {
                              Navigator.of(context)
                                  .pushNamed(MainApp.routeName);
                            }
                          },
                        ),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
