import 'package:Covid19_PH/ui/partials/views/facilities_summary_view/concretes/faciltites_card.dart';
import 'package:Covid19_PH/ui/partials/views/facilities_summary_view/facilities_summary_view_model.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                SizedBox(height: 10),
                _BuildTitle(title: 'Availability of Beds', enableLegends: true),
                _BuildDetailsRow(
                  title: 'ICU Beds',
                  occupanyRate: model.isBusy
                      ? null
                      : (model.data.icuOccupied /
                          (model.data.icuOccupied + model.data.icuVacant)),
                  occupied: model.isBusy ? null : model.data.icuOccupied,
                  vacant: model.isBusy ? null : model.data.icuVacant,
                ),
                _BuildDetailsRow(
                  title: 'Isolation Beds',
                  occupanyRate: model.isBusy
                      ? null
                      : (model.data.isolbedOccupied /
                          (model.data.isolbedOccupied +
                              model.data.isolbedVacant)),
                  occupied: model.isBusy ? null : model.data.isolbedOccupied,
                  vacant: model.isBusy ? null : model.data.isolbedVacant,
                ),
                _BuildDetailsRow(
                  title: 'Ward Beds',
                  occupanyRate: model.isBusy
                      ? null
                      : (model.data.bedwardOccupied /
                          (model.data.bedwardOccupied +
                              model.data.bedwardVacant)),
                  occupied: model.isBusy ? null : model.data.bedwardOccupied,
                  vacant: model.isBusy ? null : model.data.bedwardVacant,
                ),
                _BuildTitle(
                    title: 'Availability of Equipments', enableLegends: false),
                _BuildDetailsRow(
                  title: 'Mechanical Ventilation',
                  occupanyRate: model.isBusy
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

class _BuildTitle extends StatelessWidget {
  final bool enableLegends;
  final String title;

  const _BuildTitle({Key key, this.enableLegends, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold)),
          (enableLegends ? _BuildLegends() : Container())
        ],
      ),
    );
  }
}

class _BuildDetailsRow extends StatelessWidget {
  final double occupanyRate;
  final String title;
  final int occupied, vacant;

  const _BuildDetailsRow(
      {Key key,
      @required this.occupanyRate,
      @required this.title,
      @required this.occupied,
      @required this.vacant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: SizeConfig.screenHeight * 0.025,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: SizeConfig.screenWidth / 3,
              child: AutoSizeText(title,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w300)),
            ),
            _BuilderMeter(
                occupanyRate: occupanyRate, occupied: occupied, vacant: vacant),
          ],
        ),
      ),
    );
  }
}

class _BuilderMeter extends StatelessWidget {
  final double occupanyRate;
  final int occupied, vacant;

  const _BuilderMeter(
      {Key key,
      @required this.occupanyRate,
      @required this.occupied,
      @required this.vacant})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (occupanyRate == null
        ? Container(child: Text('loading...'))
        : LayoutBuilder(
            builder: (context, constaints) => Row(
              children: [
                AutoSizeText(
                  occupied?.toString() ?? '...',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.red,
                      fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    height: constaints.maxHeight,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: [occupanyRate, occupanyRate],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: <Color>[
                          const Color(0xffEB5757),
                          const Color(0xff27AE60)
                        ],
                      ),
                    ),
                  ),
                ),
                AutoSizeText(
                  vacant?.toString() ?? '...',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.green,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ));
  }
}

class _BuildLegends extends StatelessWidget {
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
}
