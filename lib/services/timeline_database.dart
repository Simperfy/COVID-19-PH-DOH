import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:meta/meta.dart';

import 'package:Covid19_PH/services/api_path.dart';

import 'network_helper.dart';

class TimelineDatabase {
  CaseTimeline caseTimeline;
  TimelineDatabase._({@required this.caseTimeline});
  static final instance = TimelineDatabase._(caseTimeline: CaseTimeline());

  Future<JsonBase> getCasesTimeline() async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.getCasesTimeline()}');

    return caseTimeline.fromJson(await networkHelper.getData());
  }
}
