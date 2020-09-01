import 'package:Covid19_PH/ui/pages/views/facilities_view/facilities_view.dart';
import 'package:Covid19_PH/ui/partials/views/search_bar_view/_delegates/_base/search_bar_delegate_base.dart';
import 'package:Covid19_PH/util/hospital_list.dart';
import 'package:flutter/material.dart';

class FacilitiesSearchBarDelegate extends SearchBarDelegateBase {
  static final FacilitiesSearchBarDelegate _instance = FacilitiesSearchBarDelegate._internal();
  factory FacilitiesSearchBarDelegate() => _instance;
  FacilitiesSearchBarDelegate._internal() {
    HOSPITAL_LIST.forEach((hospital) => data.add(hospital['name']));
  }

  var recentQueries = [];

  /// Shows results
  @override
  Widget buildResults(BuildContext context) {
    if (data.contains(query)) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: FacilitiesView(regionQuery: query),
      );
    }
    return Container();
  }

}
