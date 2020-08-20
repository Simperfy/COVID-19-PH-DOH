import 'package:Covid19_PH/ui/partials/views/summary_view/sub/sub_active_cases.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/sub/sub_died.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/sub/sub_recovered.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/main/main_total_cases.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/summary_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Widget that displays summary
class SummaryView extends StatelessWidget {
  final String regionQuery;

  SummaryView({this.regionQuery});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FutureSummaryViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => FutureSummaryViewModel(),
      builder: (context, model, child) {
        return Column(
          children: [
            TotalCases(count: (model.isBusy ? null : model.data.total)),
            Row(
              children: <Widget>[
                ActiveCases(
                    count: (model.isBusy ? null : model.data.activeCases)),
                Recovered(count: (model.isBusy ? null : model.data.recoveries)),
                Died(count: (model.isBusy ? null : model.data.deaths))
              ],
            ),
          ],
        );
      },
    );
  }
}
