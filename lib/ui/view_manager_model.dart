import 'package:Covid19_PH/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class ViewManagerModel extends IndexTrackingViewModel {
  initialise() {
    print('Home View Model Initialized');
    notifyListeners();
  }

  Widget getIcon({@required filename, @required index}) => _buildSvg(
        filename: filename,
        color: (index == currentIndex)
            ? bottomNavBarActiveColor
            : bottomNavBarIdleColor,
      );

  static SvgPicture _buildSvg({
    @required String filename,
    @required Color color,
  }) =>
      SvgPicture.asset(
        'assets/icons/$filename.svg',
        color: color,
        placeholderBuilder: (context) => Icon(Icons.error),
        width: 42,
      );
}
