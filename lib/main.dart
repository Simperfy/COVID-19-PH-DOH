import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:Covid19_PH/model/hospital_list.dart';
import 'package:Covid19_PH/model/record_list.dart';
import 'package:Covid19_PH/ui/views/home/home_view.dart';
import 'package:Covid19_PH/widgets/bottom_navbar_widget/bottom_navbar_widget.dart';
import 'package:Covid19_PH/widgets/search_bar_widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:Covid19_PH/services/database.dart';

import 'model/region_list.dart';
import 'model/summary.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Master(),
    );
  }
}

class Master extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    testDb();
    return Scaffold(
      appBar: SearchBarWidget(),
      body: Container(
        child: Home(),
      ),
      bottomNavigationBar: BottomNavBarWidget(context: context),
    );
  }
}

//Sample use of database
Future<void> testDb() async {
  Database database = Database(
    summary: Summary(),
    caseTimeline: CaseTimeLine(),
    hospitalList: HospitalList(),
    recordList: RecordList(),
    regionList: RegionList(),
  );

  try {
    var summary = await database.getSummary();
    print('summary : $summary \n');
    print('summary data: ${summary.getData()}');

    print('\n\n\n');

    var regionSummary = await database.getRegionSummary(region: 'ncr');
    print('regionSummary : $regionSummary \n');
    print('regionSummary data : ${regionSummary.getData()}');

    print('\n\n\n');

    var topRegions = await database.getTopRegions();
    print('topRegions : $topRegions \n');
    print('topRegions region #1 : ${topRegions.getData().regionList.first}');

    print('\n\n\n');

    var caseTimeline = await database.getCasesTimeline();
    print('caseTimeline : $caseTimeline\n');
    print('caseTimeline case #1 : ${caseTimeline.getData().caseList.first}');

    print('\n\n\n');

    var fetchRecord = await database.fetchRecord(pageNumber: 1, limit: 5);
    print('fetchRecord : $fetchRecord\n');
    print('fetchRecord record #1 : ${fetchRecord.getData().recordList.first}');

    print('\n\n\n');

    var fetchRecordByAge = await database.fetchRecordByAge(age: 30);
    print('fetchRecordByAge : $fetchRecordByAge\n');
    if (fetchRecordByAge.getData().recordList.isNotEmpty) {
      print(
          'fetchRecordByAge record #1  : ${fetchRecordByAge.getData().recordList.first}');
    }

    print('\n\n\n');

    var fetchRecordByAgeGroup =
        await database.fetchRecordByAgeGroup(minAge: 20, maxAge: 24);
    print('fetchRecordByAgeGroup : $fetchRecordByAgeGroup\n');

    if (fetchRecordByAgeGroup.getData().recordList.isNotEmpty) {
      print(
          'fetchRecordByAgeGroup record #1 : ${fetchRecordByAgeGroup.getData().recordList.first}');
    }

    print('\n\n\n');

    var fetchRecordByMonth = await database.fetchRecordByMonth(monthNumber: 5);
    print('fetchRecordByMonth : $fetchRecordByMonth\n');
    if (fetchRecordByMonth.getData().recordList.isNotEmpty) {
      print(
          'fetchRecordByMonth record #1: ${fetchRecordByMonth.getData().recordList.first}');
    }
    print('\n\n\n');

    var fetchRecordByRegion = await database.fetchRecordByRegion(region: 'ncr');
    print('fetchRecordByRegion : $fetchRecordByRegion\n');
    if (fetchRecordByRegion.getData().recordList.isNotEmpty) {
      print(
          'fetchRecordByRegion record #1: ${fetchRecordByRegion.getData().recordList.first}');
    }

    print('\n\n\n');

    var fetchHospitalRecords = await database.fetchHospitalRecords();
    print('fetchHospitalRecords : $fetchHospitalRecords \n');
    if (fetchHospitalRecords.getData().hospitalList.isNotEmpty) {
      print(
          'fetchHospitalRecords record #1: ${fetchHospitalRecords.getData().hospitalList.first}');
    }
  } catch (e) {
    print(e);
    print('missing data in api');
  }
}
