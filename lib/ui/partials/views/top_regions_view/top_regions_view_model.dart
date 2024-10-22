import 'package:Covid19_PH/model/region.dart';
import 'package:Covid19_PH/services/region_database.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// A singleton View Model
class TopRegionsViewModel extends FutureViewModel<List<Widget>> {
  static final TopRegionsViewModel _singleton = TopRegionsViewModel._internal();
  factory TopRegionsViewModel() => _singleton;
  TopRegionsViewModel._internal();

  @override
  Future<List<Widget>> futureToRun() {
    // print('FIRING TOP REGIONS VIEW MODEL');
    return _getTopRegions();
  }

  Future<List<Widget>> _getTopRegions() async {
    final RegionDatabase database = RegionDatabase.instance;

    List<Region> data = (await database.getTopRegions()).getData().regionList;
    List<Widget> widgetList = [];
    int index = 0;

    data.forEach((region) {
      widgetList.add(
        AutoSizeText(
          '${++index}. ${region.region} - ${region.cases}',
          style: TextStyle(fontSize: SizeConfig.getFigmaCardsFontSize14, fontWeight: FontWeight.w100),
        ),
      );
      widgetList.add(SizedBox(height: 15));
    });

    return widgetList;
  }
}
