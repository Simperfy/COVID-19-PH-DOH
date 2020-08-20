import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/region_list.dart';
import 'package:meta/meta.dart';

import 'package:Covid19_PH/services/api_path.dart';

import 'network_helper.dart';

class RegionDatabase {
  RegionList regionList;
  RegionDatabase._({@required this.regionList});
  static final instance = RegionDatabase._(regionList: RegionList());

  Future<JsonBase> getTopRegions() async {
    NetworkHelper networkHelper = NetworkHelper('${APIPath.getTopRegions()}');

    return regionList.fromJson(await networkHelper.getData());
  }
}
