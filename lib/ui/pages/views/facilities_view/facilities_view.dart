import 'package:Covid19_PH/ui/pages/views/facilities_view/facilities_view_model.dart';
import 'package:Covid19_PH/ui/widgets/facilities_widgets/facilities_details_row.dart';
import 'package:Covid19_PH/ui/widgets/facilities_widgets/facilitites_title.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      //       : _FacilitiesBodyView(regionQuery: this.regionQuery),
      // return ModalProgressHUD(
      //   inAsyncCall: model.isBusy,
      //   child: model.isBusy
      //       ? Container()
      //       : _FacilitiesBodyView(regionQuery: this.regionQuery),
      // );
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
      height: 163,
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
            vertical: 30,
            horizontal: MediaQuery.of(context).size.width * 0.075),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${model.hospitalSummary?.hospitalName ?? model.headerTitle}',
              style: whiteTextStyle.copyWith(fontSize: 20),
            ),
            SizedBox(height: 25),
            RichText(
              text: TextSpan(
                  style: whiteTextStyle.copyWith(fontSize: 25),
                  children: [
                    TextSpan(text: 'Overall:'),
                    TextSpan(
                      text: model.checkFacilitiesCondition(),
                      style: TextStyle(color: Colors.green),
                    ),
                  ]),
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
    return model.isBusy
        ? Container()
        : SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _FacilitiesTitleCard(),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 5),
                      // TODO: This can be improved using a loop
                      FacilitiesTitle(
                          title: 'Facilities(covid):', enableLegends: true),
                      FacilitiesDetailsRow(
                        occupancyRate: model.calculateOccupancyRate(model.hospitalSummary?.icuVacant, model.hospitalSummary?.icuOccupied),
                        title: 'icu beds:',
                        occupied: model.hospitalSummary?.icuOccupied,
                        vacant: model.hospitalSummary?.icuVacant,
                      ),
                      FacilitiesDetailsRow(
                        occupancyRate: model.calculateOccupancyRate(model.hospitalSummary?.isolbedVacant, model.hospitalSummary?.isolbedOccupied),
                        title: 'isolation beds:',
                        occupied: model.hospitalSummary?.isolbedOccupied,
                        vacant: model.hospitalSummary?.isolbedVacant,
                      ),
                      FacilitiesDetailsRow(
                        occupancyRate: model.calculateOccupancyRate(model.hospitalSummary?.bedwardVacant, model.hospitalSummary?.bedwardOccupied),
                        title: 'bed wards:',
                        occupied: model.hospitalSummary?.bedwardOccupied,
                        vacant: model.hospitalSummary?.bedwardVacant,
                      ),
                      FacilitiesDetailsRow(
                        occupancyRate: model.calculateOccupancyRate(model.hospitalSummary?.mechventVacant, model.hospitalSummary?.mechventOccupied),
                        title: 'mech vent:',
                        occupied: model.hospitalSummary?.mechventOccupied,
                        vacant: model.hospitalSummary?.mechventVacant,
                      ),
                      SizedBox(height: 30),
                      FacilitiesTitle(
                          title: 'Facilities(non-covid):',
                          enableLegends: false),
                      FacilitiesDetailsRow(
                        occupancyRate: model.calculateOccupancyRate(model.hospitalSummary?.icuVacantNc, model.hospitalSummary?.icuOccupiedNc),
                        title: 'icu beds:',
                        occupied: model.hospitalSummary?.icuOccupiedNc,
                        vacant: model.hospitalSummary?.icuVacantNc,
                      ),
                      FacilitiesDetailsRow(
                        occupancyRate: model.calculateOccupancyRate(model.hospitalSummary?.nonIcuVacantNc, model.hospitalSummary?.nonIcuOccupiedNc),
                        title: 'non-icu beds:',
                        occupied: model.hospitalSummary?.nonIcuOccupiedNc,
                        vacant: model.hospitalSummary?.nonIcuVacantNc,
                      ),
                      FacilitiesDetailsRow(
                        occupancyRate: model.calculateOccupancyRate(model.hospitalSummary?.mechventVacantNc, model.hospitalSummary?.mechventOccupiedNc),
                        title: 'mech vent:',
                        occupied: model.hospitalSummary?.mechventOccupiedNc,
                        vacant: model.hospitalSummary?.mechventVacantNc,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
