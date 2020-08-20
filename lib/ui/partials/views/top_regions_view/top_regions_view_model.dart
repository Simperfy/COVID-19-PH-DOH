import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:Covid19_PH/model/hospital_list.dart';
import 'package:Covid19_PH/model/record_list.dart';
import 'package:Covid19_PH/model/region.dart';
import 'package:Covid19_PH/model/region_list.dart';
import 'package:Covid19_PH/model/summary.dart';
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
    final Database database = Database(
      summary: Summary(),
      caseTimeline: CaseTimeline(),
      hospitalList: HospitalList(),
      recordList: RecordList(),
      regionList: RegionList(),
    );

    List<Region> data = (await database.getTopRegions()).getData().regionList;
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
