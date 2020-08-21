import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:meta/meta.dart';

import 'package:Covid19_PH/services/api_path.dart';

import 'network_helper.dart';

class TimelineDatabase {
  CaseTimeline caseTimeline;
  TimelineDatabase._({@required this.caseTimeline});
  static final instance = TimelineDatabase._(caseTimeline: CaseTimeline());

  Future<JsonBase> getCasesTimeline({String region}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.getCasesTimeline(region: region)}');

    return caseTimeline.fromJson(await networkHelper.getData());
  }
}
