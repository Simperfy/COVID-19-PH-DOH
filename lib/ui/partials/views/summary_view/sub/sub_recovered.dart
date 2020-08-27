import 'package:Covid19_PH/ui/partials/views/summary_view/base/abstracts/abstract_summary.dart';
import 'package:flutter/material.dart';
import 'package:Covid19_PH/util/constants.dart';

class Recovered extends AbstractSummary {
  Recovered({@required count}) : super(count: count, color: recoveredBgColor, label: 'Recovered');
}
