import 'package:Covid19_PH/ui/partials/views/summary_view/sub/sub_text/sub_text_count.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/sub/sub_text/sub_text_label.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/util/helper.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/material.dart';

abstract class AbstractSummary extends StatelessWidget {
  final int count;
  final Color color;
  final String label;

  final double mainSummaryCardHeight = SizeConfig.getSummaryCardMainHeight;
  final double subSummaryCardHeight = SizeConfig.getSummaryCardSubHeight;

  final double _subMinLabelFontSize = 10;
  final double _subMaxLabelFontSize =
      SizeConfig.getSummaryCardSubHeight * summaryLabelFontSizeMultiplier;

  final double _subMinCountFontSize = 16;
  final double _subMaxCountFontSize =
      SizeConfig.getSummaryCardSubHeight * summaryCountFontSizeMultiplier;

  AbstractSummary(
      {@required this.count, @required this.color, @required this.label});

  @override
  Widget build(BuildContext context) {
    final double subWidth = SizeConfig.screenWidth / 3;
    // final double leftPadding = subWidth * 0.159;
    final double verticalPadding = subWidth * 0.079;
    return Container(
      width: subWidth,
      height: subSummaryCardHeight,
      padding: EdgeInsets.only(left: 30, top: verticalPadding, bottom: verticalPadding),
      decoration: BoxDecoration(color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SubTextLabelWidget(
              label: label,
              fontSize: Helper.calculateSummaryCardFontSize(
                current: subSummaryCardHeight * 0.193,
                min: _subMinLabelFontSize,
                max: _subMaxLabelFontSize,
              )),
          SubTextCountWidget(
              count: count,
              fontSize: Helper.calculateSummaryCardFontSize(
                current: subSummaryCardHeight * 0.354,
                min: _subMinCountFontSize,
                max: _subMaxCountFontSize,
              ))
        ],
      ),
    );
  }
}
