import 'dart:convert';

import 'package:Covid19_PH/model/region.dart';
import 'package:Covid19_PH/model/regionList.dart';
import 'package:Covid19_PH/model/summary.dart';
import 'package:meta/meta.dart';

import 'package:Covid19_PH/services/api_path.dart';

import 'network_helper.dart';

class Database {
  Future<Summary> getSummary() async {
    NetworkHelper networkHelper = NetworkHelper('${APIPath.getSummary()}');

    print(json.decode(await networkHelper.getData()));

    return Summary.fromJson(await networkHelper.getData());
  }

  Future<dynamic> getRegionSummary({@required String region}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.getRegionSummary(region)}');

    return Summary.fromJson(await networkHelper.getData());
  }

  Future<RegionList> getTopRegions() async {
    NetworkHelper networkHelper = NetworkHelper('${APIPath.getTopRegions()}');

    return RegionList.fromJson(await networkHelper.getData());
  }

  // Future<CaseTimeline> getCasesTimeline() async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('${APIPath.getCasesTimeline()}');

  //   return Cases.fromJson(await networkHelper.getData());
  // }

  // Future<dynamic> fetchRecord(
  //     {@required int pageNumber, @required int limit}) async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('${APIPath.fetchRecord(pageNumber, limit)}');

  //   return networkHelper.getData();
  // }

  // Future<dynamic> fetchRecordByAge({@required int age}) async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('${APIPath.fetchRecordByAge(age)}');

  //   return networkHelper.getData();
  // }

  // Future<dynamic> fetchRecordByAgeGroup(
  //     {@required int minAge, @required int maxAge}) async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('${APIPath.fetchRecordByAgeGroup(minAge, maxAge)}');

  //   return networkHelper.getData();
  // }

  // Future<dynamic> fetchRecordByMonth({@required int monthNumber}) async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('${APIPath.fetchRecordByAge(monthNumber)}');

  //   return networkHelper.getData();
  // }

  // Future<dynamic> fetchRecordByRegion({@required String region}) async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('${APIPath.fetchRecordByRegion(region)}');

  //   return networkHelper.getData();
  // }
}
