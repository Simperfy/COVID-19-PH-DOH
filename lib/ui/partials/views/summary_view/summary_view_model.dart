import 'package:Covid19_PH/model/summary.dart';
import 'package:Covid19_PH/services/summary_database.dart';
import 'package:stacked/stacked.dart';

/// A singleton View Model
class SummaryViewModel extends FutureViewModel<Summary> {
  static final SummaryViewModel _singleton = SummaryViewModel._internal();
  factory SummaryViewModel() => _singleton;
  SummaryViewModel._internal();

  @override
  Future<Summary> futureToRun() {
    return _getSummary();
  }

  /// Gets Summary from the api
  Future<Summary> _getSummary() async {
    final SummaryDatabase database = SummaryDatabase.instance;
    return (await database.getSummary()).getData();
  }
}
