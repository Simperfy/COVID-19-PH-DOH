import 'package:Covid19_PH/ui/pages/views/facilities_view/facilities_view_model.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          return SingleChildScrollView(
            child: Column(
              children: [
                _HospitalHeaderCard(),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: _HospitalFacilitiesView(regionQuery: this.regionQuery),
                ),
              ],
            ),
          );
        });
  }
}

class _HospitalHeaderCard extends StatelessWidget {
  const _HospitalHeaderCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              'ST. FRANCES CABINI MEDICAL CENTER, INC.',
              style: whiteTextStyle.copyWith(fontSize: 20),
            ),
            SizedBox(height: 25),
            RichText(
              text: TextSpan(
                  style: whiteTextStyle.copyWith(fontSize: 25),
                  children: [
                    TextSpan(text: 'Overall:'),
                    TextSpan(
                      text: ' GOOD',
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

class _HospitalFacilitiesView extends StatelessWidget {
  final String regionQuery;

  _HospitalFacilitiesView({this.regionQuery});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 5),
        _BuildTitle(title: 'Facilities(covid):', enableLegends: true),
        _BuildDetailsRow(
          title: 'icu beds:',
          occupanyRate: .5,
        ),
        _BuildDetailsRow(
          title: 'isolation beds:',
          occupanyRate: .5,
        ),
        _BuildDetailsRow(
          title: 'bed wards:',
          occupanyRate: .5,
        ),
        _BuildDetailsRow(
          title: 'mech vent:',
          occupanyRate: .5,
        ),
        SizedBox(height: 30),
        _BuildTitle(title: 'Facilities(non-covid):', enableLegends: false),
        _BuildDetailsRow(
          title: 'icu beds:',
          occupanyRate: .5,
        ),
        _BuildDetailsRow(
          title: 'non-icu beds:',
          occupanyRate: .5,
        ),
        _BuildDetailsRow(
          title: 'mech vent:',
          occupanyRate: .5,
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
  final double occupanyRate;
  final String title;

  const _BuildDetailsRow({Key key, this.occupanyRate, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w300)),
          _BuilderMeter(occupanyRate: occupanyRate),
        ],
      ),
    );
  }
}

class _BuilderMeter extends StatelessWidget {
  final double occupanyRate;

  const _BuilderMeter({Key key, this.occupanyRate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (occupanyRate == null
        ? Container(child: Text('loading...'))
        : Row(
            children: [
              Text(
                '1000',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.red,
                    fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  height: 15,
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
              Text(
                '1000',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.green,
                    fontWeight: FontWeight.w300),
              ),
            ],
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
