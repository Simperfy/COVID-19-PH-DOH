import 'package:Covid19_PH/model/case.dart';
import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:Covid19_PH/services/timeline_database.dart';
import 'package:Covid19_PH/ui/widgets/timeline_chart_widget/time_series.dart';
import 'package:stacked/stacked.dart';

/// A singleton View Model
class TimelineViewModel extends FutureViewModel<List<TimeSeries>> {
  String query;
  // static final TimelineViewModel _singleton = TimelineViewModel._internal();
  // factory TimelineViewModel() => _singleton;
  // TimelineViewModel._internal();

  TimelineViewModel({this.query});
  @override
  Future<List<TimeSeries>> futureToRun() {
    return _getSummary();
  }

  /// Gets Summary from the api
  Future<List<TimeSeries>> _getSummary() async {
    final List<TimeSeries> data = [];
    final TimelineDatabase database = TimelineDatabase.instance;
    final CaseTimeline caseTimeLine = query == null
        ? (await database.getCasesTimeline()).getData()
        : (await database.getCasesTimeline(region: query)).getData();

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
