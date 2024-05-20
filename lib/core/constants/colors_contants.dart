import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xFF6357CC);
  static const Color secondaryColor = Color(0xff8F67E8);
  static const Color yellowColor = Color(0xffFE9C5E);
  static const Color dividerColor = Color(0xffE5E7EB);
  static const Color text1Color = Color(0xff323B4B);
  static const Color subTitleColor = Color(0xff838383);
  static const Color backgroundScaffoldColor = Color(0xffF2F2F2);
}

class Gradients {
  static const Gradient defaultGradientBackgound = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorPalette.secondaryColor,
      ColorPalette.primaryColor,
    ],
  );
}
