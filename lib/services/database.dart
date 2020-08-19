import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:meta/meta.dart';

import 'package:Covid19_PH/services/api_path.dart';

import 'network_helper.dart';

class Database {
  JsonBase summary, caseTimeline, regionList, recordList, hospitalList;
  Database({
    @required this.summary,
    @required this.caseTimeline,
    @required this.regionList,
    @required this.recordList,
    @required this.hospitalList,
  });

  Future<JsonBase> getSummary() async {
    NetworkHelper networkHelper = NetworkHelper('${APIPath.getSummary()}');

    return summary.fromJson(await networkHelper.getData());
  }

  Future<JsonBase> getRegionSummary({@required String region}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.getRegionSummary(region)}');

    return summary.fromJson(await networkHelper.getData());
  }

  Future<JsonBase> getTopRegions() async {
    NetworkHelper networkHelper = NetworkHelper('${APIPath.getTopRegions()}');

    return regionList.fromJson(await networkHelper.getData());
  }

  Future<JsonBase> getCasesTimeline() async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.getCasesTimeline()}');

    return caseTimeline.fromJson(await networkHelper.getData());
  }

  Future<JsonBase> fetchRecord(
      {@required int pageNumber, @required int limit}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecord(pageNumber, limit)}');

    return recordList.fromJson(await networkHelper.getData());
  }

  Future<JsonBase> fetchRecordByAge({@required int age}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByAge(age)}');

    return recordList.fromJson(await networkHelper.getData());
  }

  Future<JsonBase> fetchRecordByAgeGroup(
      {@required int minAge, @required int maxAge}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByAgeGroup(minAge, maxAge)}');

    print(await networkHelper.getData());

    return recordList.fromJson(await networkHelper.getData());
  }

  Future<JsonBase> fetchRecordByMonth({@required int monthNumber}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByAge(monthNumber)}');

    return recordList.fromJson(await networkHelper.getData());
  }

  Future<JsonBase> fetchRecordByRegion({@required String region}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByRegion(region)}');

    return recordList.fromJson(await networkHelper.getData());
  }

  Future<JsonBase> fetchHospitalRecords() async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchHospitalRecords()}');

    return hospitalList.fromJson(await networkHelper.getData());
  }
}
