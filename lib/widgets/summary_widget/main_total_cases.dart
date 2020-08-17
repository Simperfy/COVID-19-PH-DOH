import 'package:Covid19_PH/widgets/summary_widget/base/summary_base.dart';
import 'package:Covid19_PH/widgets/summary_widget/main/main_text_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/widgets/summary_widget/main/main_text_count.dart';

class TotalCases extends SummaryBase {
  TotalCases({@required count}) : super(count: count);
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
          MainTextLabel(label: 'Total Cases', fontSize: 16),
          TextCountWidget(count: count, fontSize: summaryMainFontSize)
        ],
      ),
    );
  }
}
