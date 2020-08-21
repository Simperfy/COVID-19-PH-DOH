import 'package:Covid19_PH/model/hospital_list.dart';
import 'package:Covid19_PH/services/hospital_database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing Hospital Database", () {
    HospitalDatabase hospitalDatabase;
    HospitalList expectedOutput;
    setUp(() {
      hospitalDatabase = HospitalDatabase.instance;
      expectedOutput = HospitalList(hospitalList: [], lastUpdate: 'no-date');
    });

    test("Method Test: getTopRegions()", () async {
      final item = await hospitalDatabase.fetchHospitalRecords();
      final itemData = item.getData();
      expect(itemData.runtimeType, expectedOutput.runtimeType);
    });
  });
}
