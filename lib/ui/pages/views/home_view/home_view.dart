import 'package:Covid19_PH/ui/pages/views/home_view/home_view_model.dart';
import 'package:Covid19_PH/ui/partials/views/facilities_summary_view/facilities_summary_view.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/summary_view.dart';
import 'package:Covid19_PH/ui/partials/views/timeline_view/timeline_view.dart';
import 'package:Covid19_PH/ui/partials/views/top_regions_view/top_regions_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  final String regionQuery;

  HomeView({this.regionQuery});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => HomeViewModel(),
      // onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Container(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 30),
                ...model.addCard(1, SummaryView(regionQuery: this.regionQuery)),
                ...model.addCard(2, TimelineView(regionQuery: this.regionQuery)),
                ...((this.regionQuery == null) ? model.addCard(3, TopRegionsView()) : [Container()]),
                ...model.addCard(4, FacilitiesSummaryView(regionQuery: 'ncr')),
              ],
            ),
          ),
        );
      },
    );
  }
} // Add SizedBox to every card