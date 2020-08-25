import 'package:Covid19_PH/model/summary.dart';
import 'package:Covid19_PH/services/summary_database.dart';
import 'package:stacked/stacked.dart';

const String _SummaryFutureName = 'delayedSummary';

/// A singleton View Model
class FutureSummaryViewModel extends MultipleFutureViewModel {
  static String regionQuery;
  static final FutureSummaryViewModel _singleton = FutureSummaryViewModel._internal();
  factory FutureSummaryViewModel() => _singleton;
  FutureSummaryViewModel._internal();

  Summary get fetchedSummary => dataMap[_SummaryFutureName];
  bool get fetchingSummary => busy(_SummaryFutureName);

  /// Gets Summary from the api
  Future<Summary> _getSummary() async {
    final SummaryDatabase database = SummaryDatabase.instance;

    var result = (regionQuery == null)
        ? (await database.getSummary())
        : (await database.getRegionSummary(region: regionQuery.toLowerCase()));

    return result.getData();
  }

  @override
  Map<String, Future Function()> get futuresMap => {
        _SummaryFutureName: _getSummary,
      };
}
