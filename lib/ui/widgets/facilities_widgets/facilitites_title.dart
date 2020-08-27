import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/material.dart';

class FacilitiesTitle extends StatelessWidget {
  final bool enableLegends;
  final String title;

  const FacilitiesTitle({Key key, this.enableLegends, this.title})
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
                  fontSize: SizeConfig.getFontSize2,
                  fontWeight: FontWeight.bold)),
          (enableLegends ? _buildLegends(context) : Container())
        ],
      ),
    );
  }
}

Widget _buildLegends(BuildContext context) => Row(
      children: <Widget>[
        Container(
          width: SizeConfig.getFontSize7,
          height: SizeConfig.getFontSize7,
          color: Color(0xffEB5757),
          margin: EdgeInsets.only(right: 3),
        ),
        Text(
          'Occupied',
          style: TextStyle(
              fontSize: SizeConfig.getFontSize5,
              fontWeight: FontWeight.w300),
        ),
        SizedBox(width: 10),
        Container(
          width: SizeConfig.getFontSize7,
          height: SizeConfig.getFontSize7,
          color: Color(0xff27AE60),
          margin: EdgeInsets.only(right: 3),
        ),
        Text(
          'Vacant',
          style: TextStyle(
              fontSize: SizeConfig.getFontSize5,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
