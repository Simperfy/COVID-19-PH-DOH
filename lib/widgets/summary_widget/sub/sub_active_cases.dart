import 'package:Covid19_PH/widgets/summary_widget/base/summary_base.dart';
import 'package:Covid19_PH/widgets/summary_widget/sub/sub_text/sub_text_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/widgets/summary_widget/sub/sub_text/sub_text_count.dart';

class ActiveCases extends SummaryBase {
  ActiveCases({@required count}) : super(count: count);
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
          TextLabelWidget(label: 'Active Cases', fontSize: 14),
          TextCountWidget(count: count, fontSize: summarySubFontSize)
        ],
      ),
    );
  }
}