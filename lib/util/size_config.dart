import 'package:flutter/widgets.dart';

class SizeConfig {
  // APPBAR
  static double _minAppbarHeight = 56;
  static double _maxAppbarHeight = 62;
  static double _multiplierAppbarHeight = 0.069;

  static double _minAppbarTextSize = 24;
  static double _maxAppbarTextSize = 30;
  static double _multiplierAppbarTextSize = 0.033;

  static double _maxAppbarIconSize = 36;
  static double _minAppbarIconSize = 24;
  static double _multiplierAppbarIconSize = getAppbarHeight * 0.677;
  // ./APPBAR

  // BOTNAVBAR
  static double _minBotNavbarHeight = _minAppbarHeight;
  static double _maxBotNavbarHeight = _maxAppbarHeight;
  static double _multiplierBotNavbarHeight = _multiplierAppbarHeight;

  static double _maxBotNavbarIconSize = _maxAppbarIconSize;
  static double _minBotNavbarIconSize = _minAppbarIconSize;
  static double _multiplierBotNavbarIconSize = 0.030;
  // ./BOTNAVBAR

  // CARDS
  static double _maxCardsSize = screenHeight / 2.5;
  static double _minCardsSize = screenHeight / 3;
  static double _multiplierCardsSize = 0.187;
  // ./CARDS

  static double screenWidth;
  static double screenHeight;

  static void init(BoxConstraints constraints) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;

    // print('screenHeight: $screenHeight');
  }

  // APPBAR
  static double get getAppbarHeight => _calculateSize(
      _minAppbarHeight, _maxAppbarHeight, _multiplierAppbarHeight);

  static double get getAppbarTextSize => _calculateSize(
      _minAppbarTextSize, _maxAppbarTextSize, _multiplierAppbarTextSize);

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

  // CARDS
  static double get getCardsHeight => _calculateSize(
      _maxCardsSize,
      _minCardsSize,
      _multiplierCardsSize,);

  static double get getSummaryCardMainHeight => getCardsHeight * 0.666;
  static double get getSummaryCardSubHeight => getCardsHeight * 0.333;
  static double get getCardsPadding => screenWidth * 0.072;
  // ./CARDS

  static double _calculateSize(double min, double max, double multiplier) {
    double res = screenHeight * multiplier;
    if (res < min) res = min;
    if (res > max) res = max;
    return res;
  }
}
