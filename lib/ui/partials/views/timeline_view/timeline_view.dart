import 'package:Covid19_PH/ui/partials/views/timeline_view/concretes/timeline_card.dart';
import 'package:Covid19_PH/ui/partials/views/timeline_view/timeline_view_model.dart';
import 'package:Covid19_PH/ui/widgets/timeline_chart_widget/timeline_chart_widget.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Main Widget class for timeline
class TimelineView extends StatelessWidget {
  final String regionQuery;

  TimelineView({this.regionQuery});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TimelineViewModel>.reactive(
      viewModelBuilder: () {
        TimelineViewModel.regionQuery = this.regionQuery;
        return TimelineViewModel();
      },
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) {
        return TimelineCard(
          bgColor: dailyCasesBgColor,
          timelineChartWidget: TimelineChartWidget(data: model?.data),
        );
      },
    );
  }
}
