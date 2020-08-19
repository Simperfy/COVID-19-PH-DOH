import 'package:flutter/foundation.dart';

import 'package:Covid19_PH/model/record.dart';

import 'base/jsonBase.dart';

class RecordList implements JsonBase {
  List<Record> recordList;
  String lastUpdate;
  RecordList({
    this.recordList,
    this.lastUpdate,
  });

  @override
  JsonBase fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return RecordList(
      recordList:
          List<Record>.from(map['data']?.map((x) => Record().fromJson(x))),
      lastUpdate: map['last_update'],
    );
  }

  @override
  getData() {
    return this;
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
