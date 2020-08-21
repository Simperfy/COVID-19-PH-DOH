import 'dart:convert';

import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/region.dart';
import 'package:Covid19_PH/model/region_list.dart';
import 'package:Covid19_PH/services/region_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDatabase extends Mock implements RegionDatabase {}

void main() {
  MockDatabase mockDatabase;
  JsonBase expectedOutput;
  group("Testing Region Database", () {
    setUp(() {
      final model = RegionList();
      mockDatabase = MockDatabase();
      expectedOutput = RegionList(regionList: [
        Region(region: 'region xii: soccsksargen', cases: 551),
        Region(region: 'caraga', cases: 370),
      ], lastUpdate: "8/21/2020, 9:38:13 PM");

      final decodedJson = json.decode(
          '{"data":[{"region":"region xii: soccsksargen","cases":551},{"region":"caraga","cases":370}],"last_update":"8/21/2020, 9:38:13 PM"}');

      when(mockDatabase.getTopRegions())
          .thenAnswer((_) async => model.fromJson(decodedJson));
    });

    test("Method Test: getTopRegions()", () async {
      final item = await mockDatabase.getTopRegions();
      final itemData = item.getData();
      expect(itemData, expectedOutput);
    });
  });
}
