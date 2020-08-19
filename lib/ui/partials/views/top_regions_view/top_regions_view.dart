import 'package:Covid19_PH/ui/partials/views/timeline_view/concretes/timeline_card.dart';
import 'package:Covid19_PH/ui/partials/views/top_regions_view/concretes/top_regions_card.dart';
import 'package:Covid19_PH/ui/partials/views/top_regions_view/top_regions_view_model.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class TopRegionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopRegionsViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => TopRegionsViewModel(),
      builder: (context, model, child) {
        return TopRegionsCard(
          bgColor: dailyCasesBgColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    (model.data == null ? 'Loading...' : 'Top Regions'),
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
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
