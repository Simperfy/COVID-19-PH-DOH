import 'package:Covid19_PH/model/case.dart';
import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:Covid19_PH/model/hospital_list.dart';
import 'package:Covid19_PH/model/record_list.dart';
import 'package:Covid19_PH/model/region_list.dart';
import 'package:Covid19_PH/model/summary.dart';
import 'package:Covid19_PH/services/database.dart';
import 'package:Covid19_PH/ui/widgets/timeline_chart_widget/time_series.dart';
import 'package:stacked/stacked.dart';

/// A singleton View Model
class TimelineViewModel extends FutureViewModel<List<TimeSeries>> {
  static final TimelineViewModel _singleton = TimelineViewModel._internal();
  factory TimelineViewModel() => _singleton;
  TimelineViewModel._internal();

  @override
  Future<List<TimeSeries>> futureToRun() {
    return _getSummary();
  }

  /// Gets Summary from the api
  Future<List<TimeSeries>> _getSummary() async {
    final List<TimeSeries> data = [];
    final Database database = Database(
      summary: Summary(),
      caseTimeline: CaseTimeLine(),
      hospitalList: HospitalList(),
      recordList: RecordList(),
      regionList: RegionList(),
    );
    final CaseTimeLine caseTimeLine = (await database.getCasesTimeline()).getData();

    if (caseTimeLine != null) {
      List<Case> caseList = caseTimeLine.caseList;
      caseList.forEach((c) {
        List<int> dateList =
            c.date.split('-').map((s) => int.parse(s)).toList();
        data.add(new TimeSeries(
            time: new DateTime(dateList[0], dateList[1], dateList[2]),
            cases: c.cases));
      });
    }

    return data;
  }
}
