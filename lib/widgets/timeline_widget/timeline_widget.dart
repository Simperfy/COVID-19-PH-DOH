import 'package:Covid19_PH/model/case.dart';
import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:Covid19_PH/services/database.dart';
import 'package:Covid19_PH/util/constants.dart';

/// Timeseries chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:Covid19_PH/widgets/timeline_widget/time_series.dart';

class SimpleTimeSeriesChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SimpleTimeSeriesChartState();
}

class _SimpleTimeSeriesChartState extends State<SimpleTimeSeriesChart> {
  List<TimeSeries> data = [];

  @override
  void initState() {
    super.initState();
    this._getTimeline();
  }

  // @TODO @DOGGO Remove this logic out of this view(2)
  Future _getTimeline() async {
    print('getting summary');
    final Database database = Database();
    final CaseTimeLine caseTimeLine = await database.getCasesTimeline();

    if (caseTimeLine != null) {
      setState(() {
        List<Case> caseList = caseTimeLine.caseList;
        caseList.forEach((c) {
          List<int> dateList = c.date.split('-').map((s) => int.parse(s)).toList();
          this.data.add(new TimeSeries(time: new DateTime(dateList[0], dateList[1], dateList[2]), cases: c.cases));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<TimeSeries, DateTime>> seriesList = [
      charts.Series<TimeSeries, DateTime>(
        id: 'time series',
        data: data,
        domainFn: (TimeSeries series, _) => series.time,
        measureFn: (TimeSeries series, _) => series.cases,
      ),
    ];

    // @TODO @DOGGO change fontSizes to dynamic value
    // https://google.github.io/charts/flutter/example/axes/custom_font_size_and_color.html
    return Container(
      height: mainHeight * 3,
      decoration: BoxDecoration(
        color: dailyCasesBgColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Text('Daily Cases', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
          Expanded(
            child: charts.TimeSeriesChart(
              seriesList,
              animate: true,

              primaryMeasureAxis: new charts.NumericAxisSpec(
                renderSpec: new charts.GridlineRendererSpec(
                  labelStyle: new charts.TextStyleSpec(
                    fontSize: 14, // size in Pts.
                    fontWeight: 'GOOGLE PLEASE FIX THIS', // @FIXME will cause error once updated  
                    color: charts.MaterialPalette.black,
                  ),
                  labelAnchor: charts.TickLabelAnchor.after,
                  labelOffsetFromAxisPx: -10,
                ),
              ),

              domainAxis: new charts.DateTimeAxisSpec(
                renderSpec: new charts.SmallTickRendererSpec(
                  labelStyle: new charts.TextStyleSpec(
                    fontSize: 15, // size in Pts.
                    fontWeight: 'NOT WORKING ATM, GOOGLE', // @FIXME will cause error once updated
                    color: charts.MaterialPalette.black,
                  ),
                  minimumPaddingBetweenLabelsPx: 5,
                  labelAnchor: charts.TickLabelAnchor.before,
                  labelOffsetFromAxisPx: 10,
                ),
                showAxisLine: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
