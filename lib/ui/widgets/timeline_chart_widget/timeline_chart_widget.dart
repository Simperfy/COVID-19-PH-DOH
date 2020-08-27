import 'package:Covid19_PH/ui/widgets/timeline_chart_widget/time_series.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

/// Controls how the timeline chart renders
class TimelineChartWidget extends charts.TimeSeriesChart {
  // TODO @DOGGO change fontSizes to dynamic value
  // https://google.github.io/charts/flutter/example/axes/custom_font_size_and_color.html
  TimelineChartWidget({@required data})
      : super(
          [
            charts.Series<TimeSeries, DateTime>(
              id: 'time series',
              data: data ?? [],
              domainFn: (TimeSeries series, _) => series.time,
              measureFn: (TimeSeries series, _) => series.cases,
            ),
          ],
          animate: true,
          primaryMeasureAxis: new charts.NumericAxisSpec(
            renderSpec: new charts.GridlineRendererSpec(
              labelStyle: new charts.TextStyleSpec(
                fontSize: SizeConfig.getFontSize4.toInt(), // size in Pts.
                fontWeight:
                    'GOOGLE PLEASE FIX THIS', // @FIXME will cause error once updated
                color: charts.MaterialPalette.black,
              ),
              labelAnchor: charts.TickLabelAnchor.after,
              // labelOffsetFromAxisPx: -10,
            ),
          ),
          domainAxis: new charts.DateTimeAxisSpec(
            renderSpec: new charts.SmallTickRendererSpec(
              labelStyle: new charts.TextStyleSpec(
                fontSize: SizeConfig.getFontSize3.toInt(), // size in Pts.
                fontWeight:
                    'NOT WORKING ATM, GOOGLE', // @FIXME will cause error once updated
                color: charts.MaterialPalette.black,
              ),
              minimumPaddingBetweenLabelsPx: 5,
              labelAnchor: charts.TickLabelAnchor.before,
              labelOffsetFromAxisPx: 10,
            ),
            showAxisLine: false,
          ),
        );
}
