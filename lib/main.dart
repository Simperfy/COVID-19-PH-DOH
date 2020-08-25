import 'package:Covid19_PH/services/hospital_database.dart';
import 'package:Covid19_PH/services/record_database.dart';
import 'package:Covid19_PH/services/region_database.dart';
import 'package:Covid19_PH/services/summary_database.dart';
import 'package:Covid19_PH/services/timeline_database.dart';
import 'package:Covid19_PH/ui/view_manager.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(builder: (context, constraints) {
        SizeConfig.init(constraints);
        return ViewManager();
      }),
    );
  }
}

//Sample use of database
Future<void> testDb() async {
  SummaryDatabase summaryDatabase = SummaryDatabase.instance;
  HospitalDatabase hospitalDatabase = HospitalDatabase.instance;
  RegionDatabase regionDatabase = RegionDatabase.instance;
  RecordDatabase recordDatabase = RecordDatabase.instance;
  TimelineDatabase timelineDatabase = TimelineDatabase.instance;

  try {
    var summary = await summaryDatabase.getSummary();
    print('summary : $summary \n');
    print('summary data: ${summary.getData()}');

    print('\n\n\n');

    var regionSummary = await summaryDatabase.getRegionSummary(region: 'ncr');
    print('regionSummary : $regionSummary \n');
    print('regionSummary data : ${regionSummary.getData()}');

    print('\n\n\n');

    var topRegions = await regionDatabase.getTopRegions();
    print('topRegions : $topRegions \n');
    print('topRegions region #1 : ${topRegions.getData().regionList.first}');

    print('\n\n\n');

    var caseTimeline = await timelineDatabase.getCasesTimeline();
    print('caseTimeline : $caseTimeline\n');
    print('caseTimeline case #1 : ${caseTimeline.getData().caseList.first}');

    print('\n\n\n');

    var fetchRecord = await recordDatabase.fetchRecord(pageNumber: 1, limit: 5);
    print('fetchRecord : $fetchRecord\n');
    print('fetchRecord record #1 : ${fetchRecord.getData().recordList.first}');

    print('\n\n\n');

    var fetchRecordByAge = await recordDatabase.fetchRecordByAge(age: 30);
    print('fetchRecordByAge : $fetchRecordByAge\n');
    if (fetchRecordByAge.getData().recordList.isNotEmpty) {
      print(
          'fetchRecordByAge record #1  : ${fetchRecordByAge.getData().recordList.first}');
    }

    print('\n\n\n');

    var fetchRecordByAgeGroup =
        await recordDatabase.fetchRecordByAgeGroup(minAge: 20, maxAge: 24);
    print('fetchRecordByAgeGroup : $fetchRecordByAgeGroup\n');

    if (fetchRecordByAgeGroup.getData().recordList.isNotEmpty) {
      print(
          'fetchRecordByAgeGroup record #1 : ${fetchRecordByAgeGroup.getData().recordList.first}');
    }

    print('\n\n\n');

    var fetchRecordByMonth =
        await recordDatabase.fetchRecordByMonth(monthNumber: 5);
    print('fetchRecordByMonth : $fetchRecordByMonth\n');
    if (fetchRecordByMonth.getData().recordList.isNotEmpty) {
      print(
          'fetchRecordByMonth record #1: ${fetchRecordByMonth.getData().recordList.first}');
    }
    print('\n\n\n');

    var fetchRecordByRegion =
        await recordDatabase.fetchRecordByRegion(region: 'ncr');
    print('fetchRecordByRegion : $fetchRecordByRegion\n');
    if (fetchRecordByRegion.getData().recordList.isNotEmpty) {
      print(
          'fetchRecordByRegion record #1: ${fetchRecordByRegion.getData().recordList.first}');
    }

    print('\n\n\n');

    var fetchHospitalRecords = await hospitalDatabase.fetchHospitalRecords();
    print('fetchHospitalRecords : $fetchHospitalRecords \n');
    if (fetchHospitalRecords.getData().hospitalList.isNotEmpty) {
      print(
          'fetchHospitalRecords record #1: ${fetchHospitalRecords.getData().hospitalList.first}');
    }

    // TODO: @DOGGO model updates forgot to (add timelineRegion[cause it's in the other branch])
    print('\n\n\n');
    var fetchHospitalRecordsSummary =
        await hospitalDatabase.fetchHospitalRecordsSummary();
    print('fetchHospitalRecordsSummary : $fetchHospitalRecordsSummary \n');
    if (fetchHospitalRecordsSummary.getData()) {
      print(
          'fetchHospitalRecordsSummary record #1: ${fetchHospitalRecordsSummary.getData().hospitalList.first}');
    }
  } catch (e) {
    print(e);
    print('missing data in api');
  }
}
