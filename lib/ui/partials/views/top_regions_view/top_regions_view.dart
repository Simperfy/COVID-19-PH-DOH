import 'package:Covid19_PH/ui/partials/views/top_regions_view/concretes/top_regions_card.dart';
import 'package:Covid19_PH/ui/partials/views/top_regions_view/top_regions_view_model.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TopRegionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopRegionsViewModel>.reactive(
      viewModelBuilder: () => TopRegionsViewModel(),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) {
        return TopRegionsCard(
          bgColor: dailyCasesBgColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AutoSizeText(
                    (model.data == null ? 'Loading...' : 'Top Regions'),
                    style:
                        TextStyle(fontSize: SizeConfig.getFigmaCardsFontSize18, fontWeight: FontWeight.w300)),
                SizedBox(height: 20),
                ...?model.data
              ],
            ),
          ),
        );
      },
    );
  }
}
