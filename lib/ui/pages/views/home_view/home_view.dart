import 'package:Covid19_PH/ui/pages/views/home_view/home_view_model.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/summary_view.dart';
import 'package:Covid19_PH/ui/partials/views/timeline_view/timeline_view.dart';
import 'package:Covid19_PH/ui/partials/views/top_regions_view/top_regions_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Container(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 30.0),
                SummaryView(),
                SizedBox(height: 30.0),
                TimelineView(),
                SizedBox(height: 30.0),
                TopRegionsView(),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
