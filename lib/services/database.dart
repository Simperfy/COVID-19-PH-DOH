
import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:Covid19_PH/model/recordList.dart';
import 'package:Covid19_PH/model/regionList.dart';
import 'package:Covid19_PH/model/summary.dart';
import 'package:meta/meta.dart';

import 'package:Covid19_PH/services/api_path.dart';

import 'network_helper.dart';

class Database {
  Future<Summary> getSummary() async {
    NetworkHelper networkHelper = NetworkHelper('${APIPath.getSummary()}');

    // print(json.decode(await networkHelper.getData()));1

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

  Future<CaseTimeLine> getCasesTimeline() async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.getCasesTimeline()}');

    return CaseTimeLine.fromJson(await networkHelper.getData());
  }

  Future<RecordList> fetchRecord(
      {@required int pageNumber, @required int limit}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecord(pageNumber, limit)}');

    return RecordList.fromJson(await networkHelper.getData());
  }

  Future<RecordList> fetchRecordByAge({@required int age}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByAge(age)}');

    return RecordList.fromJson(await networkHelper.getData());
  }

  Future<RecordList> fetchRecordByAgeGroup(
      {@required int minAge, @required int maxAge}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByAgeGroup(minAge, maxAge)}');

    print(await networkHelper.getData());

    return RecordList.fromJson(await networkHelper.getData());
  }

  Future<RecordList> fetchRecordByMonth({@required int monthNumber}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByAge(monthNumber)}');

    return RecordList.fromJson(await networkHelper.getData());
  }

  Future<RecordList> fetchRecordByRegion({@required String region}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchRecordByRegion(region)}');

    return RecordList.fromJson(await networkHelper.getData());
  }
}
