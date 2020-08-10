import 'package:Covid19_PH/widgets/summary_widget/sub_active_cases.dart';
import 'package:Covid19_PH/widgets/summary_widget/sub_died.dart';
import 'package:Covid19_PH/widgets/summary_widget/sub_recovered.dart';
import 'package:Covid19_PH/widgets/summary_widget/total_cases.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TotalCases(),
      Row(children: <Widget>[
        ActiveCases(),
        Recovered(),
        Died()
      ]),
    ]);
  }
}