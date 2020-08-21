import 'package:Covid19_PH/model/summary.dart';
import 'package:Covid19_PH/services/summary_database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing Summary Database", () {
    SummaryDatabase summaryDatabase;
    Summary expectedOutput;
    setUp(() {
      summaryDatabase = SummaryDatabase.instance;
      expectedOutput = Summary(
        total: 1,
        activeCases: 1,
        recoveries: 1,
        deaths: 1,
        recoveryRate: '.2',
        fatalityRate: '.2',
        lastUpdate: 'no-date',
      );
    });

    test("Method Test: getSummary()", () async {
      final item = await summaryDatabase.getSummary();
      final itemData = item.getData();
      expect(itemData.runtimeType, expectedOutput.runtimeType);
    });

    test("Method Test: getRegionSummary()", () async {
      final item = await summaryDatabase.getRegionSummary(region: 'ncr');
      final itemData = item.getData();
      expect(itemData.runtimeType, expectedOutput.runtimeType);
    });
  });
}
