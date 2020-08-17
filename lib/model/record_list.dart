
import 'package:flutter/foundation.dart';

import 'package:Covid19_PH/model/record.dart';

class RecordList {
  List<Record> recordList;
  String lastUpdate;
  
  RecordList({
    this.recordList,
    this.lastUpdate,
  });

  factory RecordList.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return RecordList(
      recordList:
          List<Record>.from(map['data']?.map((x) => Record.fromJson(x))),
      lastUpdate: map['last_update'],
    );
  }

  @override
  String toString() =>
      'RecordList(recordList: $recordList, last_update: $lastUpdate)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RecordList &&
        listEquals(o.recordList, recordList) &&
        o.lastUpdate == lastUpdate;
  }

  @override
  int get hashCode => recordList.hashCode ^ lastUpdate.hashCode;
}
