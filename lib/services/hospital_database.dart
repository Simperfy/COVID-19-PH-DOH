import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/hospital.dart';
import 'package:Covid19_PH/model/hospital_list.dart';
import 'package:meta/meta.dart';

import 'package:Covid19_PH/services/api_path.dart';

import 'network_helper.dart';

class HospitalDatabase {
  HospitalList hospitalList;
  HospitalDatabase._({@required this.hospitalList});
  static final instance = HospitalDatabase._(hospitalList: HospitalList());

  Future<JsonBase> fetchHospitalRecords() async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.fetchHospitalRecords()}');

    return hospitalList.fromJson(await networkHelper.getData());
  }
}
