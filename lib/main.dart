import 'package:Covid19_PH/ui/views/home/home_view.dart';
import 'package:Covid19_PH/widgets/search_bar_widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

import 'services/database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Master(),
    );
  }
}

class Master extends StatefulWidget {
  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
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
    var summaryData = summary['data'];
    print('summary : $summary');
    print('summary : ${summaryData['total']}');
    
    print('\n\n\n');

    var regionSummary = await database.getRegionSummary(region: 'ncr');
    var regionSummaryData = regionSummary['data'];
    print('regionSummary : $regionSummary');
    // no data
    // print('regionSummary : ${regionSummaryData[1]}');
    
    print('\n\n\n');

    var topRegions = await database.getSummary();
    var topRegionsData = topRegions['data'];
    print('topRegions : $topRegions');
    print('topRegions : ${topRegionsData[1]}');
    
    print('\n\n\n');

    var casesTimeline = await database.getCasesTimeline();
    var casesTimelineData = casesTimeline['data'];
    print('casesTimeline : $casesTimeline');
    print('casesTimeline : ${casesTimelineData[1]}');
    
    print('\n\n\n');

    var fetchRecord = await database.fetchRecord(pageNumber: 1, limit: 5);
    var fetchRecordData = fetchRecord['data'];
    print('fetchRecord : $fetchRecord');
    print('fetchRecord : ${fetchRecordData[1]}');
    
    print('\n\n\n');

    var fetchRecordByAge = await database.fetchRecordByAge(age: 30);
    var fetchRecordByAgeData = fetchRecord['data'];
    print('fetchRecordByAge : $fetchRecordByAge');
    print('fetchRecordByAge : ${fetchRecordByAgeData[1]}');
    
    print('\n\n\n');

    var fetchRecordByAgeGroup =
        await database.fetchRecordByAgeGroup(minAge: 15, maxAge: 20);
    var fetchRecordByAgeGroupData = fetchRecordByAgeGroup['data'];
    print('fetchRecordByAgeGroup : $fetchRecordByAgeGroup');
    // no data
    // print('fetchRecordByAgeGroup : ${fetchRecordByAgeGroupData[1]}');
    
    print('\n\n\n');

    var fetchRecordByMonth = await database.fetchRecordByMonth(monthNumber: 5);
    var fetchRecordByMonthData = fetchRecordByMonth['data'];
    print('fetchRecordByMonth : $fetchRecordByMonth');
    print('fetchRecordByMonth : ${fetchRecordByMonthData[0]}');

    print('\n\n\n');

    var fetchRecordByRegion = await database.fetchRecordByRegion(region: 'ncr');
    var fetchRecordByRegionData = fetchRecordByRegion['data'];
    print('fetchRecordByMonth : $fetchRecordByRegion');
    // no data
    // print('fetchRecordByMonth : ${fetchRecordByRegionData[0]}');

  } catch (e) {
    print(e);
    print('missing data in api');
  }
}
