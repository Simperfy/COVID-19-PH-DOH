import 'dart:convert';

import 'package:Covid19_PH/model/base/jsonBase.dart';
import 'package:Covid19_PH/model/hospital.dart';
import 'package:Covid19_PH/model/hospital_list.dart';
import 'package:Covid19_PH/model/hospital_summary.dart';
import 'package:Covid19_PH/services/hospital_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDatabase extends Mock implements HospitalDatabase {}

void main() {
  MockDatabase mockDatabase;
  JsonBase expectedOutput;
  group("Testing Hospital Database for Hospital Model", () {
    setUp(() {
      final model = HospitalList();
      mockDatabase = MockDatabase();
      expectedOutput = HospitalList(hospitalList: [
        Hospital(
            hfHudCode: 'DOH000000000034464',
            cfName: 'zone medical and intervention hospital, inc.',
            updatedDate: '2020-08-22T05:46:48.000Z',
            addedDate: '2020-08-22T05:46:48.000Z',
            reportDate: '2020-08-22T00:00:00.000Z',
            icuV: 0,
            icuO: 0,
            isolbedO: 0,
            isolbedV: 0,
            bedsWardV: 0,
            bedsWardO: 0,
            mechventV: 0,
            mechventO: 0,
            icuVNc: 0,
            icuONc: 0,
            nonIcuVNc: 25,
            nonIcuONc: 29,
            mechventVNc: 0,
            mechventONc: 0,
            qNurse: 0,
            qDoctor: 0,
            qOther: 0,
            nurseAdm: 0,
            doctorAdm: 0,
            otherAdm: 0,
            suspAsym: 0,
            suspMild: 0,
            suspSevere: 0,
            suspCrit: 0,
            suspDied: 0,
            probAsym: 0,
            probMild: 0,
            probSevere: 0,
            probCrit: 0,
            probDied: 0,
            tPatientAdm: 0,
            tPatientEr: 0,
            tPatientIcu: 0,
            transTtmf: 0,
            discharged: 0,
            region: 'region v: bicol region',
            regionPsgc: 'PH050000000',
            province: 'albay',
            provincePsgc: 'PH050500000',
            cityMun: 'city of ligao',
            citiyMunPsgc: 'PH050508000',
            northCoord: '0.0',
            eastCoord: '0.0'),
      ], lastUpdate: '8/23/2020, 8:37:51 PM');

      final decodedJson = json.decode(
          '{"data":[{"hfhudcode":"DOH000000000034464","cf_name":"zone medical and intervention hospital, inc.","updated_date":"2020-08-22T05:46:48.000Z","added_date":"2020-08-22T05:46:48.000Z","report_date":"2020-08-22T00:00:00.000Z","icu_v":0,"icu_o":0,"isolbed_v":0,"isolbed_o":0,"beds_ward_v":0,"beds_ward_o":0,"mechvent_v":0,"mechvent_o":0,"icu_v_nc":0,"icu_o_nc":0,"nonicu_v_nc":25,"nonicu_o_nc":29,"mechvent_v_nc":0,"mechvent_o_nc":0,"q_nurse":0,"q_doctor":0,"q_other":0,"nurse_adm":0,"doctor_adm":0,"other_adm":0,"susp_asym":0,"susp_mild":0,"susp_severe":0,"susp_crit":0,"susp_died":0,"prob_asym":0,"prob_mild":0,"prob_severe":0,"prob_crit":0,"prob_died":0,"conf_asym":0,"conf_mild":0,"conf_severe":0,"conf_crit":0,"conf_died":0,"t_patient_adm":0,"t_patient_er":0,"t_patient_icu":0,"trans_ttmf":0,"discharged":0,"region":"region v: bicol region","region_psgc":"PH050000000","province":"albay","province_psgc":"PH050500000","city_mun":"city of ligao","city_mun_psgc":"PH050508000","north_coord":"0.0","east_coord":"0.0"}],"last_update":"8/23/2020, 8:37:51 PM"}');

      when(mockDatabase.fetchHospitalRecords())
          .thenAnswer((_) async => model.fromJson(decodedJson));
    });

    test("Method Test: fetchHospitalRecords()", () async {
      final item = await mockDatabase.fetchHospitalRecords();
      final itemData = item.getData();
      expect(itemData, expectedOutput);
    });
  });

  group("Testing Hospital Database for Hospital Summary Model", () {
    setUp(() {
      final model = HospitalSummary();
      mockDatabase = MockDatabase();
      expectedOutput = HospitalSummary(
          totalFacilities: 1913,
          occupanyRate: 0.48,
          totalVacant: 9974,
          totalOccupied: 9240,
          icuVacant: 881,
          icuOccupied: 843,
          isolbedVacant: 6563,
          isolbedOccupied: 5861,
          bedwardVacant: 2530,
          bedwardOccupied: 2536,
          mechventVacant: 1532,
          mechventOccupied: 629);

      final decodedJson = json.decode(
          '{"data":{"total_facilities":1913,"occupancy_rate":0.48,"beds":{"total_vacant":9974,"total_occupied":9240,"icu_v":881,"icu_o":843,"isolbed_v":6563,"isolbed_o":5861,"beds_ward_v":2530,"beds_ward_o":2536},"equipments":{"mechvent_v":1532,"mechvent_o":629}},"last_update":"8/23/2020, 8:37:51 PM"}');

      when(mockDatabase.fetchHospitalRecordsSummary())
          .thenAnswer((_) async => model.fromJson(decodedJson));
    });

    test("Method Test: fetchHospitalRecordsSummary()", () async {
      final item = await mockDatabase.fetchHospitalRecordsSummary();
      final itemData = item.getData();
      expect(itemData, expectedOutput);
    });
  });
}
