import 'package:Covid19_PH/model/region.dart';
import 'package:Covid19_PH/services/database.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/widgets/top_regions_widget/concretes/top_regions_card.dart';
import 'package:flutter/widgets.dart';

class TopRegionsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TopRegionsWidgetState();
}

class _TopRegionsWidgetState extends State<TopRegionsWidget> {
  List<Widget> topRegionsList = [];

  void _getTopRegions() async {
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

    setState(() {
      topRegionsList = List.from(widgetList);
    });
  }

  @override
  void initState() {
    super.initState();
    _getTopRegions();
  }

  @override
  Widget build(BuildContext context) {
    return TopRegionsCard(
      bgColor: dailyCasesBgColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text((topRegionsList.isEmpty == true ? 'Loading...' :'Top Regions'),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
            SizedBox(height: 20),
            ...topRegionsList
          ],
        ),
      ),
    );
  }
}
