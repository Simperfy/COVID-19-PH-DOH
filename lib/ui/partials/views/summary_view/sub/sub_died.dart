import 'package:Covid19_PH/ui/partials/views/summary_view/base/abstracts/abstract_summary.dart';
import 'package:flutter/material.dart';
import 'package:Covid19_PH/util/constants.dart';

class Died extends AbstractSummary {
  Died({@required count}) : super(count: count, color: diedBgColor, label: 'Died');
}
