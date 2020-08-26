import 'package:Covid19_PH/ui/pages/views/facilities_view/facilities_view_model.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';

class FacilitiesView extends StatelessWidget {
  final String regionQuery;

  FacilitiesView({this.regionQuery});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FacilitiesViewModel>.reactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        viewModelBuilder: () => FacilitiesViewModel(),
        builder: (context, model, child) {
          return ModalProgressHUD(
            inAsyncCall: model.isBusy,
            child: model.isBusy
                ? Container()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        _HospitalHeaderCard(),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: _HospitalFacilitiesView(
                              regionQuery: this.regionQuery),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}

class _HospitalHeaderCard extends ViewModelWidget<FacilitiesViewModel> {
  const _HospitalHeaderCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, FacilitiesViewModel model) {
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
              '${model.headerTitle}',
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

class _HospitalFacilitiesView extends ViewModelWidget<FacilitiesViewModel> {
  final String regionQuery;

  _HospitalFacilitiesView({this.regionQuery});

  @override
  Widget build(BuildContext context, FacilitiesViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 5),
        _BuildTitle(title: 'Facilities(covid):', enableLegends: true),
        _BuildDetailsRow(
          title: 'icu beds:',
          occupied: model.hospitalSummary.icuOccupied,
          vacant: model.hospitalSummary.icuVacant,
        ),
        _BuildDetailsRow(
          title: 'isolation beds:',
          occupied: model.hospitalSummary.isolbedOccupied,
          vacant: model.hospitalSummary.isolbedVacant,
        ),
        _BuildDetailsRow(
          title: 'bed wards:',
          occupied: model.hospitalSummary.bedwardOccupied,
          vacant: model.hospitalSummary.bedwardVacant,
        ),
        _BuildDetailsRow(
          title: 'mech vent:',
          occupied: model.hospitalSummary.mechventOccupied,
          vacant: model.hospitalSummary.mechventVacant,
        ),
        SizedBox(height: 30),
        _BuildTitle(title: 'Facilities(non-covid):', enableLegends: false),
        _BuildDetailsRow(
          title: 'icu beds:',
          occupied: model.hospitalSummary.icuOccupiedNc,
          vacant: model.hospitalSummary.icuVacantNc,
        ),
        _BuildDetailsRow(
          title: 'non-icu beds:',
          occupied: model.hospitalSummary.nonIcuOccupiedNc,
          vacant: model.hospitalSummary.nonIcuVacantNc,
        ),
        _BuildDetailsRow(
          title: 'mech vent:',
          occupied: model.hospitalSummary.mechventOccupiedNc,
          vacant: model.hospitalSummary.mechventVacantNc,
        ),
      ],
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
  final String title;
  final int occupied, vacant;

  const _BuildDetailsRow(
      {Key key,
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
            _BuilderMeter(occupied: occupied, vacant: vacant),
          ],
        ),
      ),
    );
  }
}

class _BuilderMeter extends ViewModelWidget<FacilitiesViewModel> {
  final int occupied, vacant;

  const _BuilderMeter({Key key, @required this.occupied, @required this.vacant})
      : super(key: key);
  @override
  Widget build(BuildContext context, FacilitiesViewModel model) {
    return LayoutBuilder(
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
                  stops: [
                    model.calculateOccupancyRate(occupied, vacant),
                    model.calculateOccupancyRate(occupied, vacant)
                  ],
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
    );
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
