import 'package:Covid19_PH/ui/partials/views/summary_view/sub/sub_active_cases.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/sub/sub_died.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/sub/sub_recovered.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/main/main_total_cases.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/summary_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Widget that displays summary
class SummaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SummaryViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => SummaryViewModel(),
      builder: (context, model, child) {
        return Column(
          children: [
            TotalCases(count: model.data?.total),
            Row(
              children: <Widget>[
                ActiveCases(count: model.data?.activeCases),
                Recovered(count: model.data?.recoveries),
                Died(count: model.data?.deaths)
              ],
            ),
          ],
        );
      },
    );
  }
}
