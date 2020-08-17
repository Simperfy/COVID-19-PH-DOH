import 'package:flutter/foundation.dart';

import 'package:Covid19_PH/model/Hospital.dart';

class HospitalList {
  List<Hospital> hospitalList;
  String lastUpdate;
  
  HospitalList({
    this.hospitalList,
    this.lastUpdate,
  });

  factory HospitalList.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return HospitalList(
      hospitalList:
          List<Hospital>.from(map['data']?.map((x) => Hospital.fromJson(x))),
      lastUpdate: map['last_update'],
    );
  }

  @override
  String toString() =>
      'HospitalList(HospitalList: $hospitalList, last_update: $lastUpdate)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HospitalList &&
        listEquals(o.hospitalList, hospitalList) &&
        o.lastUpdate == lastUpdate;
  }

  @override
  int get hashCode => hospitalList.hashCode ^ lastUpdate.hashCode;
}