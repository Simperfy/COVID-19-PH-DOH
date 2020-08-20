import 'package:Covid19_PH/model/summary.dart';
import 'package:Covid19_PH/services/summary_database.dart';
import 'package:stacked/stacked.dart';

/// A singleton View Model
class FutureSummaryViewModel extends FutureViewModel<Summary> {
  static final FutureSummaryViewModel _singleton = FutureSummaryViewModel._internal();
  factory FutureSummaryViewModel() => _singleton;
  FutureSummaryViewModel._internal();

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
