import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Helper {
  static buildSvg({@required String svgFileName, @required Color color, double width = 42}) =>
      SvgPicture.asset(
        'assets/icons/$svgFileName.svg',
        color: color,
        placeholderBuilder: (context) => Icon(Icons.error),
        width: width,
      );
}
