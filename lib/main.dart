import 'package:Covid19_PH/ui/views/home/home_view.dart';
import 'package:Covid19_PH/widgets/search_bar_widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

import 'package:Covid19_PH/services/database.dart';

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
    //TODO: To be removed if finished hard-testing
    testDb();

    return Scaffold(
      appBar: SearchBarWidget(),
      body: Container(
        child: Home(),
      ),
    );
  }
}

//Sample use of database
Future<void> testDb() async {
  Database database = Database();

  try {
    var summary = await database.getSummary();
    print('summary : $summary');

    print('\n\n\n');

    var regionSummary = await database.getRegionSummary(region: 'ncr');
    print('regionSummary : $regionSummary');

    print('\n\n\n');

    var topRegions = await database.getTopRegions();
    print('topRegions : $topRegions');
    print('topRegions region 1 : ${topRegions.regionList.first}');

    print('\n\n\n');

    // var casesTimeline = await database.getCasesTimeline();
    // print('casesTimeline : $casesTimeline');

    // print('\n\n\n');

    // var fetchRecord = await database.fetchRecord(pageNumber: 1, limit: 5);
    // print('fetchRecord : $fetchRecord');

    // print('\n\n\n');

    // var fetchRecordByAge = await database.fetchRecordByAge(age: 30);
    // print('fetchRecordByAge : $fetchRecordByAge');

    // print('\n\n\n');

    // var fetchRecordByAgeGroup =
    //     await database.fetchRecordByAgeGroup(minAge: 15, maxAge: 20);
    // print('fetchRecordByAgeGroup : $fetchRecordByAgeGroup');

    // print('\n\n\n');

    // var fetchRecordByMonth = await database.fetchRecordByMonth(monthNumber: 5);
    // print('fetchRecordByMonth : $fetchRecordByMonth');

    // print('\n\n\n');

    // var fetchRecordByRegion = await database.fetchRecordByRegion(region: 'ncr');
    // print('fetchRecordByMonth : $fetchRecordByRegion');
  } catch (e) {
    print(e);
    print('missing data in api');
  }
}
