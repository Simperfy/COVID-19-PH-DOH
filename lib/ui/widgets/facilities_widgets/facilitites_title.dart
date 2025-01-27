import 'package:Covid19_PH/util/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
          AutoSizeText(title,
              style: TextStyle(
                  fontSize: SizeConfig.getFigmaCardsFontSize16,
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
          width: SizeConfig.getFigmaCardsFontSize5,
          height: SizeConfig.getFigmaCardsFontSize5,
          color: Color(0xffEB5757),
          margin: EdgeInsets.only(right: 3),
        ),
        AutoSizeText(
          'Occupied',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: SizeConfig.getFigmaCardsFontSize5,
              fontWeight: FontWeight.w300),
        ),
        SizedBox(width: 10),
        Container(
          width: SizeConfig.getFigmaCardsFontSize5,
          height: SizeConfig.getFigmaCardsFontSize5,
          color: Color(0xff27AE60),
          margin: EdgeInsets.only(right: 3),
        ),
        AutoSizeText(
          'Vacant',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: SizeConfig.getFigmaCardsFontSize5,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
