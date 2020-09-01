import 'package:Covid19_PH/ui/pages/views/home_view/home_view.dart';
import 'package:Covid19_PH/ui/partials/views/search_bar_view/_delegates/_base/search_bar_delegate_base.dart';
import 'package:Covid19_PH/util/region_list.dart';
import 'package:flutter/material.dart';

class HomeSearchBarDelegate extends SearchBarDelegateBase {
  static final HomeSearchBarDelegate _instance = HomeSearchBarDelegate._internal();
  factory HomeSearchBarDelegate() => _instance;
  HomeSearchBarDelegate._internal() {
    data = List.from(REGION_LIST);
  }

  var recentQueries = [];

  /// Shows results
  @override
  Widget buildResults(BuildContext context) {
    if (data.contains(query)) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: HomeView(regionQuery: query),
      );
    }
    return Container();
  }

}
