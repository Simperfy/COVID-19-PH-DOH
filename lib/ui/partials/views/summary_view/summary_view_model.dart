import 'package:Covid19_PH/model/summary.dart';
import 'package:Covid19_PH/services/database.dart';
import 'package:stacked/stacked.dart';

/// A singleton class
class SummaryViewModel extends FutureViewModel<Summary>{
  static final SummaryViewModel _singleton = SummaryViewModel._internal();
  var totalCase = 10000;
  var activeCases = 10000;
  var recovered = 10000;
  var died = 10000;

  @override
  Future<Summary> futureToRun() {
    return _getSummary();
  }

  factory SummaryViewModel() => _singleton;

  SummaryViewModel._internal();

  /// Gets Summary from the api
  Future<Summary> _getSummary() async {
    final Database database = Database();
    return await database.getSummary();
  }
}