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
    // final Map<String, dynamic> summary = await database.getSummary();

    // if (summary != null) {
    //   setState(() {
    //     print('summary response: $summary ');
    //     totalCase = summary['data']['total'];
    //     activeCases = summary['data']['active_cases'];
    //     recovered = summary['data']['recoveries'];
    //     died = summary['data']['deaths'];
    //   });
    // }
  }

  @override
  void initState() {
    super.initState();
    this._getSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TotalCases(totalCase),
      Row(children: <Widget>[
        ActiveCases(activeCases),
        Recovered(recovered),
        Died(died)
      ]),
    ]);
  }
}
