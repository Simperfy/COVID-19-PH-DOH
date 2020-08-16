import 'package:Covid19_PH/widgets/simple_chart_widget/simple_chart_widget.dart';
import 'package:Covid19_PH/widgets/summary_widget/summary_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Covid19_PH/widgets/simple_chart_widget/time_series.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<TimeSeries> data = [];
    data.add(new TimeSeries(new DateTime(2020, 1, 10), 1));
    data.add(new TimeSeries(new DateTime(2020, 3, 16), 10000));
    data.add(new TimeSeries(new DateTime(2020, 5, 13), 50000));
    data.add(new TimeSeries(new DateTime(2020, 8, 19), 100000));
    return Column(
      children: [
        SizedBox(
          height: 30.0,
        ),
        SummaryWidget(),
        SizedBox(
          height: 30.0,
        ),
        SimpleTimeSeriesChart(data)
      ],
    );
  }
}
