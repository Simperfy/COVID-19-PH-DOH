import 'package:Covid19_PH/ui/pages/views/facilities_view/facilities_view_model.dart';
import 'package:Covid19_PH/ui/partials/views/facilities_summary_view/concretes/faciltites_card.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FacilitiesSummaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FacilitiesViewModel>.reactive(
      viewModelBuilder: () => FacilitiesViewModel(),
      disposeViewModel: false,
      builder: (context, model, child) => FacilitiesCard(
        bgColor: dailyCasesBgColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Facilities Data',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              SizedBox(height: 10),

              ..._buildTitle(
                  title: 'Availability of Beds', enableLegends: true),
              ..._buildDetailsRow(title: 'ICU Beds', occupanyRate: 0.4),
              ..._buildDetailsRow(
                  title: 'Isolation Beds', occupanyRate: 0.3),
              ..._buildDetailsRow(title: 'Ward Beds', occupanyRate: 0.25),

              ..._buildTitle(
                  title: 'Availability of Equipments', enableLegends: false),
              ..._buildDetailsRow(
                  title: 'Mechanical Ventilators', occupanyRate: 0.15)
            ],
          ),
        ),
      ),
    );
  }


  List<Widget> _buildTitle(
      {@required String title, @required bool enableLegends}) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          (enableLegends ? _buildLegends() : Container())
        ],
      ),
      SizedBox(height: 5),
    ];
  }

  List<Widget> _buildDetailsRow(
      {@required String title, @required double occupanyRate}) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100)),
            _buildMeter(occupanyRate: occupanyRate),
          ],
        ),
      ),
      SizedBox(height: 5)
    ];
  }

  Container _buildMeter({@required double occupanyRate}) {
    return Container(
      height: 10,
      width: facilitiesSummaryGradientBarLength,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [occupanyRate, occupanyRate],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: <Color>[const Color(0xffEB5757), const Color(0xff27AE60)],
        ),
      ),
    );
  }

  Row _buildLegends() {
    return Row(
      children: <Widget>[
        Container(
          width: 5,
          height: 5,
          color: Color(0xffEB5757),
          margin: EdgeInsets.only(right: 3),
        ),
        Text('Occupied',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100)),
        SizedBox(width: 10),
        Container(
          width: 5,
          height: 5,
          color: Color(0xff27AE60),
          margin: EdgeInsets.only(right: 3),
        ),
        Text('Vacant',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100)),
      ],
    );
  }
}
