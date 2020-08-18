import 'package:Covid19_PH/widgets/base/abstracts/abstract_home_view_card.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

/// Contains Text and padding for the timeline card
class TimelineCard extends AbstractHomeViewCard {
  TimelineCard({
    @required Color bgColor,
    @required charts.TimeSeriesChart timelineChartWidget,
  }) : super(
          bgColor: bgColor,
          child: Column(
            children: [
              Text(
                'Daily Cases',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              Expanded(child: timelineChartWidget),
            ],
          ),
        );
}
