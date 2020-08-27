import 'package:Covid19_PH/ui/partials/views/facilities_summary_view/concretes/faciltites_card.dart';
import 'package:Covid19_PH/ui/partials/views/facilities_summary_view/facilities_summary_view_model.dart';
import 'package:Covid19_PH/ui/widgets/facilities_widgets/facilities_details_row.dart';
import 'package:Covid19_PH/ui/widgets/facilities_widgets/facilitites_title.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FacilitiesSummaryView extends StatelessWidget {
  final String regionQuery;

  FacilitiesSummaryView({this.regionQuery});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FacilitiesSummaryViewModel>.reactive(
      viewModelBuilder: () {
        FacilitiesSummaryViewModel.setRegionQuery(regionQuery);
        return FacilitiesSummaryViewModel();
      },
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) {
        return FacilitiesCard(
          bgColor: dailyCasesBgColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Facilities Data',
                    style:
                        TextStyle(fontSize: SizeConfig.getFontSize1, fontWeight: FontWeight.w300)),
                SizedBox(height: 10),
                FacilitiesTitle(
                    title: 'Availability of Beds', enableLegends: true),
                FacilitiesDetailsRow(
                  title: 'ICU Beds',
                  occupancyRate: model.isBusy
                      ? null
                      : (model.data.icuOccupied /
                          (model.data.icuOccupied + model.data.icuVacant)),
                  occupied: model.isBusy ? null : model.data.icuOccupied,
                  vacant: model.isBusy ? null : model.data.icuVacant,
                ),
                FacilitiesDetailsRow(
                  title: 'Isolation Beds',
                  occupancyRate: model.isBusy
                      ? null
                      : (model.data.isolbedOccupied /
                          (model.data.isolbedOccupied +
                              model.data.isolbedVacant)),
                  occupied: model.isBusy ? null : model.data.isolbedOccupied,
                  vacant: model.isBusy ? null : model.data.isolbedVacant,
                ),
                FacilitiesDetailsRow(
                  title: 'Ward Beds',
                  occupancyRate: model.isBusy
                      ? null
                      : (model.data.bedwardOccupied /
                          (model.data.bedwardOccupied +
                              model.data.bedwardVacant)),
                  occupied: model.isBusy ? null : model.data.bedwardOccupied,
                  vacant: model.isBusy ? null : model.data.bedwardVacant,
                ),
                FacilitiesTitle(
                    title: 'Availability of Equipments', enableLegends: false),
                FacilitiesDetailsRow(
                  title: 'Mechanical Ventilation',
                  occupancyRate: model.isBusy
                      ? null
                      : (model.data.mechventOccupied /
                          (model.data.mechventOccupied +
                              model.data.mechventVacant)),
                  occupied: model.isBusy ? null : model.data.mechventOccupied,
                  vacant: model.isBusy ? null : model.data.mechventVacant,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

@override
Widget build(BuildContext context) {
  return Row(
    children: <Widget>[
      Container(
        width: 10,
        height: 10,
        color: Color(0xffEB5757),
        margin: EdgeInsets.only(right: 3),
      ),
      Text(
        'Occupied',
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.w300),
      ),
      SizedBox(width: 10),
      Container(
        width: 10,
        height: 10,
        color: Color(0xff27AE60),
        margin: EdgeInsets.only(right: 3),
      ),
      Text(
        'Vacant',
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.w300),
      ),
    ],
  );
}
