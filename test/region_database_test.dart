import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/record_list.dart';
import 'package:Covid19_PH/model/region_list.dart';
import 'package:Covid19_PH/services/region_database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing Record Database", () {
    RegionDatabase recordDatabase;
    RegionList expectedOutput;
    setUp(() {
      recordDatabase = RegionDatabase.instance;
      expectedOutput = RegionList(regionList: [], lastUpdate: 'no-date');
    });

    test("Method Test: fetchRecord()", () async {
      JsonBase item = await recordDatabase.getTopRegions();
      RecordList itemData = item.getData();
      expect(itemData.runtimeType, expectedOutput.runtimeType);
    });
  });
}
