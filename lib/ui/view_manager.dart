import 'package:Covid19_PH/ui/pages/views/facilities_view/facilities_view.dart';
import 'package:Covid19_PH/ui/pages/views/home_view/home_view.dart';
import 'package:Covid19_PH/ui/view_manager_model.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/widgets/search_bar_widget/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class ViewManager extends StatelessWidget {
  static final Widget svgHome =
      _buildSvg(filename: 'home', color: bottomNavBarActiveColor);
  static final Widget svgHosp =
      _buildSvg(filename: 'hospital', color: bottomNavBarIdleColor);
  static final Widget svgMap =
      _buildSvg(filename: 'map', color: bottomNavBarIdleColor);
  static final Widget svgSettings =
      _buildSvg(filename: 'settings', color: bottomNavBarIdleColor);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewManagerModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => ViewManagerModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: SearchBarWidget(),
          body: getViewForIndex(model.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: svgHome, title: Text('Home')),
              BottomNavigationBarItem(icon: svgHosp, title: Text('Hospitals')),
              BottomNavigationBarItem(icon: svgMap, title: Text('Map')),
              BottomNavigationBarItem(
                  icon: svgSettings, title: Text('Settings')),
            ],
            selectedItemColor: Colors.red,
            currentIndex:model.currentIndex,
            onTap: model.setIndex,
          ),
        );
      },
    );
  }

  static SvgPicture _buildSvg(
      {@required String filename, Color color = Colors.grey}) {
    return SvgPicture.asset(
      'assets/icons/$filename.svg',
      // color: color,
      placeholderBuilder: (context) => Icon(Icons.error),
      width: 42,
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return FacilitiesView();
      case 2:
        print('Map button pressed');
        return Text('Hello');
        break;
      case 3:
        print('Settings button pressed');
        return Text('Hello');
        break;
      default:
        throw ('Cannot find index of Bottom Navigation Bar!');
    }
  }
}
