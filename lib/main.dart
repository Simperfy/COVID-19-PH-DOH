import 'package:Covid19_PH/ui/views/home/home_view.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/widgets/search_bar_widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

import 'package:Covid19_PH/services/database.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  SvgPicture _buildSvg({@required String filename, @required BuildContext bContext, Color color = Colors.grey}) {
    return SvgPicture.asset(
      'assets/icons/$filename.svg',
      color: color,
      placeholderBuilder: (context) => Icon(Icons.error),
      width: 42,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget svgHome = _buildSvg(filename: 'home', bContext: context, color: bottomNavBarActiveColor);
    final Widget svgHosp = _buildSvg(filename: 'hospital', bContext: context, color: bottomNavBarIdleColor);
    final Widget svgMap = _buildSvg(filename: 'map', bContext: context, color: bottomNavBarIdleColor);
    final Widget svgSettings = _buildSvg(filename: 'settings', bContext: context, color: bottomNavBarIdleColor);

    // testDb();
    return Scaffold(
      appBar: SearchBarWidget(),
      body: Container(
        child: Home(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: svgHome, title: Text('Home')),
          BottomNavigationBarItem(icon: svgHosp, title: Text('Hospitals')),
          BottomNavigationBarItem(icon: svgMap, title: Text('Map')),
          BottomNavigationBarItem(icon: svgSettings, title: Text('Settings')),
        ],
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
    print('topRegions region #1 : ${topRegions.regionList.first}');

    print('\n\n\n');

    var caseTimeline = await database.getCasesTimeline();
    print('caseTimeline : $caseTimeline');
    print('caseTimeline case #1 : ${caseTimeline.caseList.first}');

    print('\n\n\n');

    var fetchRecord = await database.fetchRecord(pageNumber: 1, limit: 5);
    print('fetchRecord : $fetchRecord');

    print('fetchRecord record #1 : ${fetchRecord.recordList.first}');

    print('\n\n\n');

    var fetchRecordByAge = await database.fetchRecordByAge(age: 30);
    print('fetchRecordByAge : $fetchRecordByAge');
    print('fetchRecordByAge record #1  : ${fetchRecordByAge.recordList.first}');

    print('\n\n\n');

    var fetchRecordByAgeGroup =
        await database.fetchRecordByAgeGroup(minAge: 20, maxAge: 24);
    print('fetchRecordByAgeGroup : $fetchRecordByAgeGroup');
    print(
        'fetchRecordByAgeGroup record #1 : ${fetchRecordByAgeGroup.recordList.first}');

    print('\n\n\n');

    var fetchRecordByMonth = await database.fetchRecordByMonth(monthNumber: 5);
    print('fetchRecordByMonth : $fetchRecordByMonth');

    print('\n\n\n');

    print(
        'fetchRecordByMonth record #1: ${fetchRecordByMonth.recordList.first}');

    print('\n\n\n');

    var fetchRecordByRegion = await database.fetchRecordByRegion(region: 'ncr');
    print('fetchRecordByMonth : $fetchRecordByRegion');
    print(
        'fetchRecordByMonth record #1: ${fetchRecordByRegion.recordList.first}');

    var fetchHospitalRecords = await database.fetchHospitalRecords();
    print('fetchHospitalRecords : $fetchHospitalRecords');
    print(
        'fetchHospitalRecords record #1: ${fetchHospitalRecords.hospitalList.first}');
  } catch (e) {
    print(e);
    print('missing data in api');
  }
}
