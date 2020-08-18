import 'package:Covid19_PH/model/case.dart';
import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:Covid19_PH/services/database.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/widgets/timeline_widget/concretes/timeline_card.dart';
import 'package:Covid19_PH/widgets/timeline_widget/timeline_chart_widget/timeline_chart_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:Covid19_PH/widgets/timeline_widget/timeline_chart_widget/time_series.dart';

/// Main Widget class for timeline
class TimelineWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  List<TimeSeries> data = [];

  @override
  void initState() {
    super.initState();
    this._getTimeline();
  }

  // TODO @DOGGO Remove this logic out of this view(2)
  Future _getTimeline() async {
    print('getting summary');
    final Database database = Database();
    final CaseTimeLine caseTimeLine = await database.getCasesTimeline();

    if (caseTimeLine != null) {
      setState(() {
        List<Case> caseList = caseTimeLine.caseList;
        caseList.forEach((c) {
          List<int> dateList =
              c.date.split('-').map((s) => int.parse(s)).toList();
          this.data.add(new TimeSeries(
              time: new DateTime(dateList[0], dateList[1], dateList[2]),
              cases: c.cases));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TimelineCard(
      bgColor: dailyCasesBgColor,
      timelineChartWidget: TimelineChartWidget(data: data),
    );
  }
}
