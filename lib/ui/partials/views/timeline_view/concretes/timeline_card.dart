import 'package:Covid19_PH/ui/partials/base/abstracts/abstract_home_view_card.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

/// Contains Text and padding for the timeline card
class TimelineCard extends AbstractHomeViewCard {
  TimelineCard({
    @required Color bgColor,
    @required charts.TimeSeriesChart timelineChartWidget,
  }) : super(
          bgColor: bgColor,
          child: Column(
            children: [
              AutoSizeText(
                'Daily Cases',
                style: TextStyle(fontSize: SizeConfig.getCardsHeight * 0.086, fontWeight: FontWeight.w300),
              ),
              Expanded(child: timelineChartWidget),
            ],
          ),
        );
}
