import 'dart:convert';

import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/record.dart';
import 'package:Covid19_PH/model/record_list.dart';
import 'package:Covid19_PH/services/record_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDatabase extends Mock implements RecordDatabase {}

void main() {
  MockDatabase mockDatabase;
  JsonBase expectedOutput;
  group("Testing Region Database", () {
    setUp(() {
      final model = RecordList();
      mockDatabase = MockDatabase();
      expectedOutput = RecordList(recordList: [
        Record(
            casesCode: 'C999768',
            age: 13,
            ageGroup: '10-14',
            sex: 'female',
            dateSpecimen: '2020-07-19',
            dateResultRelease: '2020-07-21',
            dateRepConf: '2020-07-26',
            dateDied: '',
            dateRecover: '',
            removalType: 'recovered',
            admitted: 'no',
            regionRes: 'region iv-a: calabarzon',
            provRes: 'laguna',
            cityMunRes: 'city of santa rosa',
            cityMuniPsgc: 'PH043428000',
            healthStatus: 'recovered',
            quaruantined: 'no',
            dateOnset: '2020-07-19',
            pregnantTab: 'no'),
      ], lastUpdate: '8/22/2020, 11:07:51 PM');

      final decodedJson = json.decode(
          '{"data":[{"case_code":"C999768","age":13,"age_group":"10-14","sex":"female","date_specimen":"2020-07-19","date_result_release":"2020-07-21","date_rep_conf":"2020-07-26","date_died":"","date_recover":"","removal_type":"recovered","admitted":"no","region_res":"region iv-a: calabarzon","prov_res":"laguna","city_mun_res":"city of santa rosa","city_muni_psgc":"PH043428000","health_status":"recovered","quarantined":"no","date_onset":"2020-07-19","pregnant_tab":"no"}],"last_update":"8/22/2020, 11:07:51 PM","pagination":{"next_page":2,"limit":10000,"max_page":19},"result_count":608}');

      when(mockDatabase.fetchRecord(pageNumber: 1, limit: 1))
          .thenAnswer((_) async => model.fromJson(decodedJson));
      when(mockDatabase.fetchRecordByAge(age: 13))
          .thenAnswer((_) async => model.fromJson(decodedJson));
      when(mockDatabase.fetchRecordByAgeGroup(minAge: 10, maxAge: 14))
          .thenAnswer((_) async => model.fromJson(decodedJson));
      when(mockDatabase.fetchRecordByMonth(monthNumber: 5))
          .thenAnswer((_) async => model.fromJson(decodedJson));
      when(mockDatabase.fetchRecordByRegion(region: 'ncr'))
          .thenAnswer((_) async => model.fromJson(decodedJson));
    });

    test("Method Test: fetchRecord()", () async {
      final item = await mockDatabase.fetchRecord(pageNumber: 1, limit: 1);
      final itemData = item.getData();
      expect(itemData, expectedOutput);
    });
    test("Method Test: fetchRecordByAge()", () async {
      final item = await mockDatabase.fetchRecordByAge(age: 13);
      final itemData = item.getData();
      expect(itemData, expectedOutput);
    });
    test("Method Test: fetchRecordByAgeGroup()", () async {
      final item =
          await mockDatabase.fetchRecordByAgeGroup(minAge: 10, maxAge: 14);
      final itemData = item.getData();
      expect(itemData, expectedOutput);
    });
    test("Method Test: fetchRecordByMonth()", () async {
      final item = await mockDatabase.fetchRecordByMonth(monthNumber: 5);
      final itemData = item.getData();
      expect(itemData, expectedOutput);
    });
    test("Method Test: fetchRecordByRegion()", () async {
      final item = await mockDatabase.fetchRecordByRegion(region: 'ncr');
      final itemData = item.getData();
      expect(itemData, expectedOutput);
    });
  });
}
