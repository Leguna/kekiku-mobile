import 'package:flutter/material.dart';

class Dimens {
  static const double nano = 1.0;
  static const double micro = 2.0;
  static const double tiny = 4.0;
  static const double small = 8.0;
  static const double medium = 12.0;
  static const double large = 16.0;
  static const double xlarge = 24.0;
  static const double xXLarge = 32.0;

  static const double spaceSmall = 50.0;
  static const double spaceMedium = 100.0;
  static const double spaceBig = 200.0;

  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 8.0);

  static const EdgeInsets customPadding =
      EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 16.0);

  static var microText = 12.0;
  static var smallText = 14.0;
  static var mediumText = 16.0;

  static late double screenWidth;
  static late double screenHeight;

  static const double borderWidth = 2.0;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}
