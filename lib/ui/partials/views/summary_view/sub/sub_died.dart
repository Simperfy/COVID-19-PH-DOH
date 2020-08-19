import 'package:Covid19_PH/ui/partials/views/summary_view/base/abstracts/abstract_summary.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/sub/sub_text/sub_text_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/sub/sub_text/sub_text_count.dart';

class Died extends AbstractSummary {
  Died({@required count}) : super(count: count);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: mainHeight,
      // padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      padding: EdgeInsets.only(left: 30.0, top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(color: diedBgColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextLabelWidget(label: 'Died', fontSize: 14),
          TextCountWidget(count: count, fontSize: summarySubFontSize)
        ],
      ),
    );
  }
}