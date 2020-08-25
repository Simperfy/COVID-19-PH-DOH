import 'package:flutter/widgets.dart';

class SizeConfig {
  // APPBAR
  static double _minAppbarHeight = 56;
  static double _maxAppbarHeight = 62;
  static double _multiplierAppbarHeight = 0.069;

  static double _maxAppbarIconSize = 36;
  static double _minAppbarIconSize = 24;
  static double _multiplierAppbarIconSize = 0.044;
  // ./APPBAR

  // BOTNAVBAR
  static double _minBotNavbarHeight = _minAppbarHeight;
  static double _maxBotNavbarHeight = _maxAppbarHeight;
  static double _multiplierBotNavbarHeight = _multiplierAppbarHeight;

  static double _maxBotNavbarIconSize = _maxAppbarIconSize;
  static double _minBotNavbarIconSize = _minAppbarIconSize;
  static double _multiplierBotNavbarIconSize = _multiplierAppbarIconSize;
  // ./BOTNAVBAR

  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double screenWidth;
  static double screenHeight;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  // static bool isMobilePortrait = false;

  static void init(BoxConstraints constraints) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;
    isPortrait = true;

    _blockWidth = screenWidth / 100;
    _blockHeight = screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    print('screenHeight: $screenHeight');
  }

  // APPBAR
  static double get getAppbarHeight => _calculateSize(
      _minAppbarHeight, _maxAppbarHeight, _multiplierAppbarHeight);

  static double get getAppbarIconSize => _calculateSize(
      _minAppbarIconSize, _maxAppbarIconSize, _multiplierAppbarIconSize);
  // ./APPBAR

  // BOTNAVBAR
  static double get getBotNavbarHeight => _calculateSize(
      _minBotNavbarHeight, _maxBotNavbarHeight, _multiplierBotNavbarHeight);

  static double get getBotNavbarIconSize => _calculateSize(
      _minBotNavbarIconSize,
      _maxBotNavbarIconSize,
      _multiplierBotNavbarIconSize);
  // ./BOTNAVBAR

  static double _calculateSize(double min, double max, double multiplier) {
    double res = screenHeight * multiplier;
    if (res < min) res = min;
    if (res > max) res = max;
    return res;
  }
}
