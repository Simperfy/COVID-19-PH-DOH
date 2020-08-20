import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:Covid19_PH/model/hospital_list.dart';
import 'package:Covid19_PH/model/record_list.dart';
import 'package:Covid19_PH/model/region_list.dart';
import 'package:Covid19_PH/model/summary.dart';
import 'package:Covid19_PH/services/database.dart';
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
    final Database database = Database(
      summary: Summary(),
      caseTimeline: CaseTimeline(),
      hospitalList: HospitalList(),
      recordList: RecordList(),
      regionList: RegionList(),
    );
    return (await database.getSummary()).getData();
  }
}
