import 'package:Covid19_PH/ui/pages/views/facilities_view/facilities_view.dart';
import 'package:Covid19_PH/ui/pages/views/home_view/home_view.dart';
import 'package:Covid19_PH/ui/view_manager_model.dart';
import 'package:Covid19_PH/ui/widgets/search_bar_widget/search_bar_widget.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ViewManager extends StatelessWidget {
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
              BottomNavigationBarItem(
                  icon: model.getIcon(filename: 'home', index: 0),
                  title: Text('Home')),
              BottomNavigationBarItem(
                  icon: model.getIcon(filename: 'hospital', index: 1),
                  title: Text('Hospitals')),
              BottomNavigationBarItem(
                  icon: model.getIcon(filename: 'map', index: 2),
                  title: Text('Map')),
              BottomNavigationBarItem(
                  icon: model.getIcon(filename: 'settings', index: 3),
                  title: Text('Settings')),
            ],
            showUnselectedLabels: false,
            selectedItemColor: bottomNavBarActiveColor,
            selectedIconTheme: IconThemeData(color: bottomNavBarActiveColor),
            unselectedItemColor: bottomNavBarIdleColor,
            unselectedIconTheme: IconThemeData(color: bottomNavBarIdleColor),
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
          ),
        );
      },
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
