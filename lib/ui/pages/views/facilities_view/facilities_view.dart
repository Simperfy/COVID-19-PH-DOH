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
          return Column(
            children: [
              _HospitalHeaderCard(),
              _HospitalFacilitiesView(regionQuery: this.regionQuery),
            ],
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
      height: 155,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        color: Colors.blue[800],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ST. FRANCES CABINI MEDICAL CENTER, INC.',
                style: whiteTextStyle.copyWith(fontSize: 17),
              ),
              SizedBox(height: 25),
              RichText(
                text: TextSpan(
                    style: whiteTextStyle.copyWith(fontSize: 26),
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
      ),
    );
  }
}

class _HospitalFacilitiesView extends StatelessWidget {
  final String regionQuery;

  _HospitalFacilitiesView({this.regionQuery});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            _BuildTitle(title: 'Facilities(covid):', enableLegends: true),
            _BuildDetailsRow(
              title: 'ICU Beds:',
              occupanyRate: .5,
            ),
            _BuildDetailsRow(
              title: 'Isolation Beds:',
              occupanyRate: .5,
            ),
            _BuildDetailsRow(
              title: 'Bed Wards:',
              occupanyRate: .5,
            ),
            _BuildDetailsRow(
              title: 'Mech Vent:',
              occupanyRate: .5,
            ),
            SizedBox(height: 25),
            _BuildTitle(title: 'Facilities(non-covid):', enableLegends: true),
            _BuildDetailsRow(
              title: 'ICU Beds:',
              occupanyRate: .5,
            ),
            _BuildDetailsRow(
              title: 'Non-ICU Beds:',
              occupanyRate: .5,
            ),
            _BuildDetailsRow(
              title: 'Mech Vent:',
              occupanyRate: .5,
            ),
          ],
        ),
      ),
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
      padding: EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
                '100',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Container(
                  height: 15,
                  width: specificFacilitiesSummaryGradientBarLength,
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
                '100',
                style: TextStyle(fontSize: 18, color: Colors.green),
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
          width: 8,
          height: 8,
          color: Color(0xffEB5757),
          margin: EdgeInsets.only(right: 3),
        ),
        Text('Occupied',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
        SizedBox(width: 10),
        Container(
          width: 8,
          height: 8,
          color: Color(0xff27AE60),
          margin: EdgeInsets.only(right: 3),
        ),
        Text('Vacant',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
      ],
    );
  }
}
