import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/summary.dart';
import 'package:meta/meta.dart';

import 'package:Covid19_PH/services/api_path.dart';

import 'network_helper.dart';

class SummaryDatabase {
  Summary summary;
  SummaryDatabase._({@required this.summary});
  static final instance = SummaryDatabase._(summary: Summary());

  Future<JsonBase> getSummary() async {
    NetworkHelper networkHelper = NetworkHelper('${APIPath.getSummary()}');

    return summary.fromJson(await networkHelper.getData());
  }

  Future<JsonBase> getRegionSummary({@required String region}) async {
    NetworkHelper networkHelper =
        NetworkHelper('${APIPath.getRegionSummary(region)}');

    return summary.fromJson(await networkHelper.getData());
  }
}
