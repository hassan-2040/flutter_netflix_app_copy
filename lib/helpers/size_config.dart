import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;

  //screen info/config
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static bool smallDevice;

  //text size config
  static double textSizeMainHeading;
  static double textSizeSubHeading;
  static double textSizeLarge;
  static double textSizeNormal;
  static double textSizeSmall;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    if (screenWidth > 350 && screenHeight > 600) {
      smallDevice = false;
    } else {
      smallDevice = true;
    }

    //setting text size based on screen size
    if (smallDevice) {
      textSizeMainHeading = 18;
      textSizeSubHeading = 14;
      textSizeLarge = 12;
      textSizeNormal = 9;
      textSizeSmall = 7;

    } else {
      textSizeMainHeading = 21;
      textSizeSubHeading = 18;
      textSizeLarge = 16;
      textSizeNormal = 12;
      textSizeSmall = 8;

    }

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
