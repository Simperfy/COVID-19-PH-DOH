import 'dart:convert';

import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/summary.dart';
import 'package:Covid19_PH/services/summary_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDatabase extends Mock implements SummaryDatabase {}

void main() {
  MockDatabase mockDatabase;
  JsonBase expectedOutput;
  group('Summary Database Testing', () {
    setUp(() {
      final model = Summary();
      mockDatabase = MockDatabase();
      expectedOutput = Summary(
          total: 182365,
          recoveries: 114519,
          deaths: 2940,
          activeCases: 64906,
          fatalityRate: '1.61',
          recoveryRate: '62.80',
          lastUpdate: "8/21/2020, 9:38:13 PM");

      final decodedJson = json.decode(
          '{"data":{"total":182365,"recoveries":114519,"deaths":2940,"active_cases":64906,"fatality_rate":"1.61","recovery_rate":"62.80"},"last_update":"8/21/2020, 9:38:13 PM"}');

      when(mockDatabase.getSummary())
          .thenAnswer((_) async => model.fromJson(decodedJson));
      when(mockDatabase.getRegionSummary(region: 'ncr'))
          .thenAnswer((_) async => model.fromJson(decodedJson));
    });

    test("Method Test: getSummary()", () async {
      final item = await mockDatabase.getSummary();
      final itemData = item.getData();
      expect(itemData, expectedOutput);
    });

    test("Method Test: getRegionSummary()", () async {
      final item = await mockDatabase.getRegionSummary(region: 'ncr');
      final itemData = item.getData();
      expect(itemData, expectedOutput);
    });
  });
}
