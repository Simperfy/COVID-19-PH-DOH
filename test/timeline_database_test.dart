import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:Covid19_PH/services/timeline_database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing Timeline Database", () {
    TimelineDatabase timelineDatabase;
    CaseTimeline expectedOutput;
    setUp(() {
      timelineDatabase = TimelineDatabase.instance;
      expectedOutput = CaseTimeline(caseList: [], lastUpdate: 'no-date');
    });

    test("Method Test: getCaseTimeline()", () async {
      final item = await timelineDatabase.getCasesTimeline();
      final itemData = item.getData();
      expect(itemData.runtimeType, expectedOutput.runtimeType);
    });

    test("Method Test: getCaseTimeline() with Region", () async {
      final item = await timelineDatabase.getCasesTimeline(region: 'ncr');
      final itemData = item.getData();
      expect(itemData.runtimeType, expectedOutput.runtimeType);
    });
  });
}
