import 'package:meta/meta.dart';

import 'package:Covid19_PH/services/api_path.dart';

import 'network_helper.dart';

class Database {
  Future<dynamic> getSummary() async {
    NetworkHelper networkHelper = NetworkHelper('${APIPath.getSummary()}');

    return networkHelper.getData();
  }

  Future<dynamic> getRegionSummary({@required String region}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.getRegionSummary(region)}');

    return networkHelper.getData();
  }

  Future<dynamic> getTopRegions() async {
    NetworkHelper networkHelper = NetworkHelper('${APIPath.getTopRegions()}');

    return networkHelper.getData();
  }

  Future<dynamic> getCasesTimeline() async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.getCasesTimeline()}');

    return networkHelper.getData();
  }

  Future<dynamic> fetchRecord(
      {@required int pageNumber, @required int limit}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecord(pageNumber, limit)}');

    return networkHelper.getData();
  }

  Future<dynamic> fetchRecordByAge({@required int age}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByAge(age)}');

    return networkHelper.getData();
  }

  Future<dynamic> fetchRecordByAgeGroup(
      {@required int minAge, @required int maxAge}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByAgeGroup(minAge, maxAge)}');

    return networkHelper.getData();
  }

  Future<dynamic> fetchRecordByMonth({@required int monthNumber}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByAge(monthNumber)}');

    return networkHelper.getData();
  }

  Future<dynamic> fetchRecordByRegion({@required String region}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByRegion(region)}');

    return networkHelper.getData();
  }
}
