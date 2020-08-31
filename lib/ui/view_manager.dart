import 'package:Covid19_PH/ui/pages/views/facilities_view/facilities_view.dart';
import 'package:Covid19_PH/ui/pages/views/home_view/home_view.dart';
import 'package:Covid19_PH/ui/partials/views/maps_view/maps_view.dart';
import 'package:Covid19_PH/ui/partials/views/search_bar_view/_delegates/facilities_search_bar_delegate.dart';
import 'package:Covid19_PH/ui/partials/views/search_bar_view/_delegates/home_search_bar_delegate.dart';
import 'package:Covid19_PH/ui/partials/views/search_bar_view/search_bar_view.dart';
import 'package:Covid19_PH/ui/view_manager_model.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ViewManager extends StatelessWidget {
  static const String _searchBar = 'search_bar';
  static const String _view = 'view';
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
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            appBar: _getViewForIndex(index: model.currentIndex)[_searchBar],
            key: _scaffoldKey, // TODO: Remove once snackbar is no longer needed
            body: _getViewForIndex(index: model.currentIndex)[_view],
            bottomNavigationBar: SizedBox(
              height: SizeConfig.getBotNavbarHeight,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: model.getIcon(filename: 'home', index: 0),
                      title: AutoSizeText('Home',
                          minFontSize: 10, maxFontSize: 16)),
                  BottomNavigationBarItem(
                      icon: model.getIcon(filename: 'hospital', index: 1),
                      title: AutoSizeText('Hospitals',
                          minFontSize: 10, maxFontSize: 16)),
                  BottomNavigationBarItem(
                      icon: model.getIcon(filename: 'map', index: 2),
                      title: AutoSizeText('Maps',
                          minFontSize: 10, maxFontSize: 16)),
                  BottomNavigationBarItem(
                      icon: model.getIcon(filename: 'settings', index: 3),
                      title: AutoSizeText('Settings',
                          minFontSize: 10, maxFontSize: 16)),
                ],
                showUnselectedLabels: false,
                selectedItemColor: bottomNavBarActiveColor,
                selectedIconTheme:
                    IconThemeData(color: bottomNavBarActiveColor),
                unselectedItemColor: bottomNavBarIdleColor,
                unselectedIconTheme:
                    IconThemeData(color: bottomNavBarIdleColor),
                currentIndex: model.currentIndex,
                onTap: (num) => num == 3 // Settings
                    ? _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text("Not Available..."),
                          duration: Duration(seconds: 1),
                        ),
                      )
                    : (num == 2) // Maps
                        ? _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text("This map contains fake data..."),
                              duration: Duration(seconds: 2),
                            ),
                          )
                        : model.setIndex(num),
              ),
            ),
          ),
        );
      },
    );
  }

  Map<String, Widget> _getViewForIndex({@required int index}) {
    switch (index) {
      case 0:
        return {
          _searchBar: SearchBarView(searchDelegate: HomeSearchBarDelegate()),
          _view: HomeView()
        };
      case 1:
        return {
          _searchBar:
              SearchBarView(searchDelegate: FacilitiesSearchBarDelegate()),
          _view: FacilitiesView()
        };
      case 2:
        return {_searchBar: SearchBarView(searchDelegate: null,), _view: MapsView()};
        break;
      case 3:
        // print('Settings button pressed');
        return {
          _searchBar: SearchBarView(
            searchDelegate: null,
          ),
          _view: Text('Settings page')
        };
        break;
      default:
        throw ('Cannot find index of Bottom Navigation Bar!');
    }
  }
}
