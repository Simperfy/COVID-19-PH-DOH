import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:Covid19_PH/model/region.dart';

class RegionList {
  List<Region> regionList;
  String lastUpdate;
  RegionList({
    this.regionList,
    this.lastUpdate,
  });

  factory RegionList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RegionList(
      regionList:
          List<Region>.from(map['data']?.map((x) => Region.fromMap(x))),
      lastUpdate: map['last_update'],
    );
  }

  factory RegionList.fromJson(String source) =>
      RegionList.fromMap(json.decode(source));

  @override
  String toString() =>
      'RegionList(regionList: $regionList, last_update: $lastUpdate)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RegionList &&
        listEquals(o.regionList, regionList) &&
        o.lastUpdate == lastUpdate;
  }

  @override
  int get hashCode => regionList.hashCode ^ lastUpdate.hashCode;
}
