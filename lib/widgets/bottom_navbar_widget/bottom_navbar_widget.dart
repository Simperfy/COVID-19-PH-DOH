import 'package:Covid19_PH/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Dummy Bottom Navbar Widget
class BottomNavBarWidget extends BottomNavigationBar {
  static final Widget svgHome =
      _buildSvg(filename: 'home', color: bottomNavBarActiveColor);
  static final Widget svgHosp =
      _buildSvg(filename: 'hospital', color: bottomNavBarIdleColor);
  static final Widget svgMap =
      _buildSvg(filename: 'map', color: bottomNavBarIdleColor);
  static final Widget svgSettings =
      _buildSvg(filename: 'settings', color: bottomNavBarIdleColor);

  BottomNavBarWidget({@required BuildContext context})
      : super(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: svgHome, title: Text('Home')),
            BottomNavigationBarItem(icon: svgHosp, title: Text('Hospitals')),
            BottomNavigationBarItem(icon: svgMap, title: Text('Map')),
            BottomNavigationBarItem(icon: svgSettings, title: Text('Settings')),
          ],
        );

  static SvgPicture _buildSvg(
      {@required String filename, Color color = Colors.grey}) {
    return SvgPicture.asset(
      'assets/icons/$filename.svg',
      color: color,
      placeholderBuilder: (context) => Icon(Icons.error),
      width: 42,
    );
  }
}
