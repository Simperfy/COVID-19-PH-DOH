import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:flutter/foundation.dart';

import 'case.dart';

class CaseTimeline implements JsonBase {
  List<Case> caseList;
  String lastUpdate;
  CaseTimeline({
    this.caseList,
    this.lastUpdate,
  });

  @override
  JsonBase fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return CaseTimeline(
      caseList: List<Case>.from(map['data']?.map((x) => Case().fromJson(x))),
      lastUpdate: map['last_update'],
    );
  }

  @override
  getData() {
    return this;
  }

  @override
  String toString() =>
      'CaseTimeLine(caseList: $caseList, last_update: $lastUpdate)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CaseTimeline &&
        listEquals(o.caseList, caseList) &&
        o.lastUpdate == lastUpdate;
  }

  @override
  int get hashCode => caseList.hashCode ^ lastUpdate.hashCode;
}
