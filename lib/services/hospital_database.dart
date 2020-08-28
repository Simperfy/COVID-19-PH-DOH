import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/hospital_list.dart';
import 'package:Covid19_PH/model/hospital_summary.dart';
import 'package:meta/meta.dart';

import 'package:Covid19_PH/services/api_path.dart';

import 'network_helper.dart';

class HospitalDatabase {
  HospitalList hospitalList;
  HospitalSummary hospitalSummary;
  HospitalDatabase._(
      {@required this.hospitalList, @required this.hospitalSummary});
  static final instance = HospitalDatabase._(
      hospitalList: HospitalList(), hospitalSummary: HospitalSummary());

  Future<JsonBase> fetchHospitalRecords() async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchHospitalRecords()}');

    return hospitalList.fromJson(await networkHelper.getData());
  }

  Future<JsonBase> fetchHospitalRecordsSummary(
      {String region, String hospitalName}) async {
    String encoded = Uri.encodeFull(APIPath.fetchHospitalRecordsSummary(
        region: region, hospitalName: hospitalName));
    print('encoded: $encoded');

    NetworkHelper networkHelper = NetworkHelper('$encoded');

    print('data:' + (await networkHelper.getData()).toString());
    return hospitalSummary.fromJson(await networkHelper.getData());
  }
}
