
import 'package:flutter/foundation.dart';

import 'case.dart';

class CaseTimeLine {
  List<Case> caseList;
  String lastUpdate;
  CaseTimeLine({
    this.caseList,
    this.lastUpdate,
  });

  factory CaseTimeLine.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return CaseTimeLine(
      caseList: List<Case>.from(map['data']?.map((x) => Case.fromJson(x))),
      lastUpdate: map['last_update'],
    );
  }

  @override
  String toString() =>
      'CaseTimeLine(caseList: $caseList, last_update: $lastUpdate)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CaseTimeLine &&
        listEquals(o.caseList, caseList) &&
        o.lastUpdate == lastUpdate;
  }

  @override
  int get hashCode => caseList.hashCode ^ lastUpdate.hashCode;
}
