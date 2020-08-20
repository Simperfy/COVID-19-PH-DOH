import 'package:Covid19_PH/ui/pages/views/facilities_view/facilities_view.dart';
import 'package:Covid19_PH/ui/pages/views/home_view/home_view.dart';
import 'package:Covid19_PH/ui/partials/views/search_bar_view/search_bar_view.dart';
import 'package:Covid19_PH/ui/view_manager_model.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ViewManager extends StatelessWidget {
  final _scaffoldKey = GlobalKey<
      ScaffoldState>(); // TODO: Remove once snackbar is no longer needed

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewManagerModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => ViewManagerModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: SearchBarView(),
          key: _scaffoldKey, // TODO: Remove once snackbar is no longer needed
          body: _getViewForIndex(index: model.currentIndex),
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
            // onTap: model.setIndex, // TODO: Uncomment to enable page navigation
            onTap: (num) => num != 0
                ? _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("Coming Soon..."),
                      duration: Duration(seconds: 1),
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }

  Widget _getViewForIndex({@required int index}) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return FacilitiesView();
      case 2:
        print('Map button pressed');
        return Text('Map page');
        break;
      case 3:
        print('Settings button pressed');
        return Text('Settings page');
        break;
      default:
        throw ('Cannot find index of Bottom Navigation Bar!');
    }
  }
}
