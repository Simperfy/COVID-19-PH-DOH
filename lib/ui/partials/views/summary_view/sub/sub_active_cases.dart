import 'package:Covid19_PH/ui/partials/views/summary_view/base/abstracts/abstract_summary.dart';
import 'package:flutter/material.dart';
import 'package:Covid19_PH/util/constants.dart';

class ActiveCases extends AbstractSummary {
  ActiveCases({@required count}) : super(count: count, color: activeCasesBgColor, label: 'Active Cases');
}
