import 'package:flutter/cupertino.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/widgets/summary_widget/main/main_text_count.dart';

class TotalCases extends StatelessWidget {
  final _count;
  TotalCases(count) : this._count = count;
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
          TextCountWidget(_count, summaryMainFontSize)
          
        ],
      ),
    );
  }
}
