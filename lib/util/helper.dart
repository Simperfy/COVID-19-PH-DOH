import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Helper {
  static buildSvg(
      {@required String svgFileName,
      @required Color color,
      @required double width}) {
    return SvgPicture.asset(
      'assets/icons/$svgFileName.svg',
      color: color,
      placeholderBuilder: (context) => Icon(Icons.error),
      width: width,
    );
  }

  static double calculateSummaryCardFontSize(
      {@required num current, @required num min, @required num max}) {
    if (current < min) return min;
    if (current > max) return max;
    return current;
  }
}
