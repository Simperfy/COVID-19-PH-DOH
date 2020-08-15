import 'package:flutter/cupertino.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/widgets/summary_widget/sub/sub_text_count.dart';

class ActiveCases extends StatelessWidget {
  final _count;
  ActiveCases(count) : this._count = count;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: mainHeight,
      // padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      padding: EdgeInsets.only(left: 30.0, top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(color: activeCasesBgColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Active Cases',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
          TextCountWidget(_count, summarySubFontSize)
          
        ],
      ),
    );
  }
}
