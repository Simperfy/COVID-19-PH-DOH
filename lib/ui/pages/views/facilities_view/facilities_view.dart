import 'package:Covid19_PH/ui/pages/views/facilities_view/facilities_view_model.dart';
import 'package:Covid19_PH/ui/widgets/facilities_widgets/facilities_details_row.dart';
import 'package:Covid19_PH/ui/widgets/facilities_widgets/facilitites_title.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';

class FacilitiesView extends StatelessWidget {
  final String regionQuery;

  FacilitiesView({this.regionQuery});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FutureFacilitiesViewModel>.nonReactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () {
        FutureFacilitiesViewModel.setRegionQuery(regionQuery);
        return FutureFacilitiesViewModel();
      },
      builder: (context, model, child) {
        return _FacilitiesBodyView();
      },
    );
  }
}

class _FacilitiesTitleCard extends ViewModelWidget<FutureFacilitiesViewModel> {
  const _FacilitiesTitleCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, FutureFacilitiesViewModel model) {
    return Container(
      height: SizeConfig.getFacilitiesViewHeaderHeight,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        color: Color(0xff0074B6),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.getCardsPadding,
          horizontal: SizeConfig.getCardsPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AutoSizeText(
                '${model.hospitalSummary?.hospitalName ?? model.headerTitle}',
                style: whiteTextStyle.copyWith(
                    fontSize: SizeConfig.getFigmaCardsFontSize20),
              ),
            ),
            Expanded(
              child: AutoSizeText.rich(
                TextSpan(
                    style: whiteTextStyle.copyWith(
                        fontSize: SizeConfig.getFigmaCardsFontSize30),
                    children: [
                      TextSpan(text: 'Overall:'),
                      TextSpan(
                        text: model.checkFacilitiesCondition(),
                        style: TextStyle(color: Colors.green),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FacilitiesBodyView extends ViewModelWidget<FutureFacilitiesViewModel> {
  @override
  Widget build(BuildContext context, FutureFacilitiesViewModel model) {
    if (FutureFacilitiesViewModel.hospitalNameQuery == null) return Container();
    return ModalProgressHUD(
      inAsyncCall: model.isBusy,
      child: model.isBusy
          ? Container()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _FacilitiesTitleCard(),
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.getCardsPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 5),
                        // TODO: This can be improved using a loop
                        FacilitiesTitle(
                            title: 'Facilities(covid):', enableLegends: true),
                        FacilitiesDetailsRow(
                          occupancyRate: model.calculateOccupancyRate(
                              occupied: model.hospitalSummary?.icuOccupied,
                              vacant: model.hospitalSummary?.icuVacant),
                          title: 'icu beds:',
                          occupied: model.hospitalSummary?.icuOccupied,
                          vacant: model.hospitalSummary?.icuVacant,
                        ),
                        FacilitiesDetailsRow(
                          occupancyRate: model.calculateOccupancyRate(
                              occupied: model.hospitalSummary?.isolbedOccupied,
                              vacant: model.hospitalSummary?.isolbedVacant),
                          title: 'isolation beds:',
                          occupied: model.hospitalSummary?.isolbedOccupied,
                          vacant: model.hospitalSummary?.isolbedVacant,
                        ),
                        FacilitiesDetailsRow(
                          occupancyRate: model.calculateOccupancyRate(
                              occupied: model.hospitalSummary?.bedwardOccupied,
                              vacant: model.hospitalSummary?.bedwardVacant),
                          title: 'bed wards:',
                          occupied: model.hospitalSummary?.bedwardOccupied,
                          vacant: model.hospitalSummary?.bedwardVacant,
                        ),
                        FacilitiesDetailsRow(
                          occupancyRate: model.calculateOccupancyRate(
                              occupied: model.hospitalSummary?.mechventOccupied,
                              vacant: model.hospitalSummary?.mechventVacant),
                          title: 'mech vent:',
                          occupied: model.hospitalSummary?.mechventOccupied,
                          vacant: model.hospitalSummary?.mechventVacant,
                        ),
                        SizedBox(height: 30),
                        FacilitiesTitle(
                            title: 'Facilities(non-covid):',
                            enableLegends: false),
                        FacilitiesDetailsRow(
                          occupancyRate: model.calculateOccupancyRate(
                              occupied: model.hospitalSummary?.icuOccupiedNc,
                              vacant: model.hospitalSummary?.icuVacantNc),
                          title: 'icu beds:',
                          occupied: model.hospitalSummary?.icuOccupiedNc,
                          vacant: model.hospitalSummary?.icuVacantNc,
                        ),
                        FacilitiesDetailsRow(
                          occupancyRate: model.calculateOccupancyRate(
                              occupied: model.hospitalSummary?.nonIcuOccupiedNc,
                              vacant: model.hospitalSummary?.nonIcuVacantNc),
                          title: 'non-icu beds:',
                          occupied: model.hospitalSummary?.nonIcuOccupiedNc,
                          vacant: model.hospitalSummary?.nonIcuVacantNc,
                        ),
                        FacilitiesDetailsRow(
                          occupancyRate: model.calculateOccupancyRate(
                              occupied:
                                  model.hospitalSummary?.mechventOccupiedNc,
                              vacant: model.hospitalSummary?.mechventVacantNc),
                          title: 'mech vent:',
                          occupied: model.hospitalSummary?.mechventOccupiedNc,
                          vacant: model.hospitalSummary?.mechventVacantNc,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
