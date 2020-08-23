import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/record_list.dart';
import 'package:meta/meta.dart';

import 'package:Covid19_PH/services/api_path.dart';

import 'network_helper.dart';

class RecordDatabase {
  RecordList recordList;
  RecordDatabase._({@required this.recordList});
  static final instance = RecordDatabase._(recordList: RecordList());

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
}
