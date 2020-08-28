import 'package:flutter/widgets.dart';

class SizeConfig {
  // APPBAR
  static double _minAppbarHeight = 56;
  static double _maxAppbarHeight = 100;
  static double _multiplierAppbarHeight = 0.069;

  static double _minAppbarTextSize = 24;
  static double _maxAppbarTextSize = 30;
  static double _multiplierAppbarTextSize = 0.033;

  static double _maxAppbarIconSize = 48;
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

  /// height of total cases container
  static double get getSummaryCardMainHeight => getCardsHeight * 0.666;
  /// height of active cases, recovered and died container
  static double get getSummaryCardSubHeight => getCardsHeight * 0.333;
  /// horizontal padding of the cards
  static double get getCardsPadding => screenWidth * 0.072;
  // ./CARDS

  // FIGMA FONT SIZES
  /// 30 px in figma
  static double get getFigmaCardsFontSize30 => getCardsHeight * 0.161;
  /// 20 px in figma
  static double get getFigmaCardsFontSize20 => getCardsHeight * 0.107;
  /// 18 px in figma
  static double get getFigmaCardsFontSize18 => getCardsHeight * 0.096;
  /// 16 px in figma
  static double get getFigmaCardsFontSize16 => getCardsHeight * 0.086;
  /// 15 px in figma
  static double get getFigmaCardsFontSize15 => getCardsHeight * 0.080;
  /// 14 px in figma
  static double get getFigmaCardsFontSize14 => getCardsHeight * 0.075;
  /// 12 px in figma
  static double get getFigmaCardsFontSize12 => getCardsHeight * 0.064;
  /// 11 px in figma
  static double get getFigmaCardsFontSize11 => getCardsHeight * 0.059;
  /// 5 px in figma
  static double get getFigmaCardsFontSize5 => getCardsHeight * 0.026;
  // ./FIGMA FONT SIZES

  /// Height of Facilities View Header
  static double get getFacilitiesViewHeaderHeight => (screenWidth * 0.174) * 2;
  // /// Vertical padding of Facilities View Header
  // static double get getFacilitiesViewHeaderVPadding => getFacilitiesViewHeaderHeight * 0.192;
  // /// Horizontal padding of Facilities View Header
  // static double get getFacilitiesViewHeaderHPadding => (screenWidth * 0.174) * 0.160;

  /// calculates the size and returns the passed value if it's within the max and min
  static double _calculateSize(double min, double max, double multiplier) {
    double res = screenHeight  * multiplier;
    if (res < min) res = min;
    if (res > max) res = max;
    return res;
  }
}
