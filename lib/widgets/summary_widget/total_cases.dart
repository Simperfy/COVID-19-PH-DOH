import 'package:flutter/cupertino.dart';
import 'package:Covid19_PH/util/constants.dart';

class TotalCases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: mainHeight * 2,
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      decoration: BoxDecoration(color: totalCasesBgColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total Cases',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
          // SizedBox(height: 22.0),
          Text('122, 754',
              style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
