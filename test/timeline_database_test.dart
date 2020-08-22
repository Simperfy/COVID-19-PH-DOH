import 'dart:convert';

import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/case.dart';
import 'package:Covid19_PH/model/case_timeline.dart';
import 'package:Covid19_PH/services/timeline_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDatabase extends Mock implements TimelineDatabase {}

void main() {
  MockDatabase mockDatabase;
  JsonBase expectedOutput;
  group("Testing Timeline Database", () {
    setUp(() {
      final model = CaseTimeline();
      mockDatabase = MockDatabase();
      expectedOutput = CaseTimeline(caseList: [
        Case(cases: 193, date: '2020-08-18'),
        Case(cases: 19, date: '2020-08-19'),
      ], lastUpdate: '8/22/2020, 8:15:42 PM');

      final decodedJson = json.decode(
          '{"data":[{"cases":193,"date":"2020-08-18"},{"cases":19,"date":"2020-08-19"}],"last_update":"8/22/2020, 8:15:42 PM"}');

      when(mockDatabase.getCasesTimeline())
          .thenAnswer((_) async => model.fromJson(decodedJson));
    });

    test("Method Test: getCasesTimeline()", () async {
      final item = await mockDatabase.getCasesTimeline();
      final itemData = item.getData();
      expect(itemData, expectedOutput);
    });
  });
}
