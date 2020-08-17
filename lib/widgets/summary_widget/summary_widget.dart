import 'package:Covid19_PH/model/summary.dart';
import 'package:Covid19_PH/widgets/summary_widget/sub_active_cases.dart';
import 'package:Covid19_PH/widgets/summary_widget/sub_died.dart';
import 'package:Covid19_PH/widgets/summary_widget/sub_recovered.dart';
import 'package:Covid19_PH/widgets/summary_widget/main_total_cases.dart';
import 'package:flutter/material.dart';
import 'package:Covid19_PH/services/database.dart';

/// Widget that displays summary
class SummaryWidget extends StatefulWidget {
  _SummaryWidgetState createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  var totalCase;
  var activeCases;
  var recovered;
  var died;

  /// Gets Summary from the api
  /// @returns void
  Future _getSummary() async {
    print('getting summary');
    final Database database = Database();
    final Summary summary = await database.getSummary();

    if (summary != null) {
      setState(() {
        print('summary response: $summary ');
        totalCase = summary.total;
        activeCases = summary.activeCases;
        recovered = summary.recoveries;
        died = summary.deaths;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this._getSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TotalCases(count: totalCase),
      Row(children: <Widget>[
        ActiveCases(count: activeCases),
        Recovered(count: recovered),
        Died(count: died)
      ]),
    ]);
  }
}
