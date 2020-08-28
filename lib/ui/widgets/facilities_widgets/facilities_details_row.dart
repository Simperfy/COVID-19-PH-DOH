import 'package:Covid19_PH/util/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FacilitiesDetailsRow extends StatelessWidget {
  final double occupancyRate;
  final String title;
  final int occupied, vacant;

  const FacilitiesDetailsRow(
      {Key key,
      @required this.occupancyRate,
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
                      fontSize: SizeConfig.getFigmaCardsFontSize16,
                      fontWeight: FontWeight.w300)),
            ),
            _buildMeter(
                context: context,
                occupanyRate: occupancyRate,
                occupied: occupied,
                vacant: vacant),
          ],
        ),
      ),
    );
  }
}

Widget _buildMeter(
    {@required BuildContext context,
    @required num occupanyRate,
    @required int occupied,
    @required int vacant}) {
  final double _occupanyRate = (occupanyRate?.isNaN == null) // return null if null
      ? null
      : (occupanyRate.isNaN ? 0 : occupanyRate); // else if isNaN return 0 else return occupancyRate
  final int _occupied = occupied;
  final int _vacant = vacant;

  return (_occupanyRate == null
      ? Container(child: AutoSizeText('loading...'))
      : LayoutBuilder(
          builder: (context, constaints) => Row(
            children: [
              AutoSizeText(
                _occupied?.toString() ?? '...',
                maxLines: 1,
                style: TextStyle(
                    fontSize: SizeConfig.getFigmaCardsFontSize11,
                    color: Colors.red,
                    fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  height: SizeConfig.getFigmaCardsFontSize11,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: [_occupanyRate, _occupanyRate],
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
                _vacant?.toString() ?? '...',
                maxLines: 1,
                style: TextStyle(
                    fontSize: SizeConfig.getFigmaCardsFontSize11,
                    color: Colors.green,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ));
}
