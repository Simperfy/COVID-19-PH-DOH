import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/record_list.dart';
import 'package:Covid19_PH/services/record_database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing Record Database", () {
    RecordDatabase recordDatabase;
    RecordList expectedOutput;
    setUp(() {
      recordDatabase = RecordDatabase.instance;
      expectedOutput = RecordList(recordList: [], lastUpdate: 'no-date');
    });

    test("Method Test: fetchRecord()", () async {
      JsonBase item = await recordDatabase.fetchRecord(limit: 1, pageNumber: 1);
      RecordList itemData = item.getData();
      expect(itemData.runtimeType, expectedOutput.runtimeType);
    });

    test("Method Test: fetchRecordByAge()", () async {
      final item = await recordDatabase.fetchRecordByAge(age: 24);
      final itemData = item.getData();
      expect(itemData.runtimeType, expectedOutput.runtimeType);
    });

    test("Method Test: fetchRecordByMonth()", () async {
      final item = await recordDatabase.fetchRecordByMonth(monthNumber: 5);
      final itemData = item.getData();
      expect(itemData.runtimeType, expectedOutput.runtimeType);
    });

    test("Method Test: fetchRecordByRegion()", () async {
      final item = await recordDatabase.fetchRecordByRegion(region: 'ncr');
      final itemData = item.getData();
      expect(itemData.runtimeType, expectedOutput.runtimeType);
    });
  });
}
