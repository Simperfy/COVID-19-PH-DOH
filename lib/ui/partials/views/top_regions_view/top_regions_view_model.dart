import 'package:Covid19_PH/model/region.dart';
import 'package:Covid19_PH/services/database.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// A singleton View Model
class TopRegionsViewModel extends FutureViewModel<List<Widget>> {
  static final TopRegionsViewModel _singleton = TopRegionsViewModel._internal();
  factory TopRegionsViewModel() => _singleton;
  TopRegionsViewModel._internal();

  List<Widget> topRegionsList = [];

  @override
  Future<List<Widget>> futureToRun() {
    return _getTopRegions();
  }

  Future<List<Widget>> _getTopRegions() async {
    Database database = Database();
    List<Region> data = (await database.getTopRegions()).regionList;
    List<Widget> widgetList = [];
    int index = 0;

    data.forEach((region) {
      widgetList.add(
        Text(
          '${++index}. ${region.region} - ${region.cases}',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
        ),
      );
      widgetList.add(SizedBox(height: 15));
    });

    return widgetList;
  }
}
