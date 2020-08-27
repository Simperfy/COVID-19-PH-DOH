import 'package:Covid19_PH/ui/partials/views/summary_view/base/abstracts/abstract_summary.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/main/main_text/main_text_label.dart';
import 'package:Covid19_PH/util/helper.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/ui/partials/views/summary_view/main/main_text/main_text_count.dart';

class TotalCases extends AbstractSummary {
  final double _mainMinLabelFontSize = 16;
  final double _mainMaxLabelFontSize =
      SizeConfig.getSummaryCardMainHeight * summaryLabelFontSizeMultiplier;

  final double _mainMinCountFontSize = 24;
  final double _mainMaxCountFontSize =
      SizeConfig.getSummaryCardMainHeight * summaryCountFontSizeMultiplier;

  // the super does not affect the UI
  // Because we override the build method
  // We just put it because of required
  TotalCases({@required count}) : super(count: count, label: null, color: null);

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = super.mainSummaryCardHeight * 0.14;
    final double horizontalPadding = SizeConfig.getCardsPadding;
    return Container(
      width: SizeConfig.screenWidth,
      height: mainSummaryCardHeight,
      decoration: BoxDecoration(color: totalCasesBgColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MainTextLabel(
                label: 'Total Cases',
                fontSize: Helper.calculateSummaryCardFontSize(
                    current: super.mainSummaryCardHeight * 0.193,
                    min: _mainMinLabelFontSize,
                    max: _mainMaxLabelFontSize)),
            MainTextCountWidget(count: count, fontSize: Helper.calculateSummaryCardFontSize(
                    current: super.mainSummaryCardHeight * 0.411,
                    min: _mainMinCountFontSize,
                    max: _mainMaxCountFontSize)),
          ],
        ),
      ),
      // padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
    );
  }
}
