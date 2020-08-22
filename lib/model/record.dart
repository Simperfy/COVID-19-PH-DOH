import 'base/jsonBase.dart';

class Record implements JsonBase {
  String casesCode;
  int age;
  String ageGroup;
  String sex;
  String dateSpecimen;
  String dateResultRelease;
  String dateRepConf;
  String dateDied;
  String dateRecover;
  String removalType;
  String admitted;
  String regionRes;
  String provRes;
  String cityMunRes;
  String cityMuniPsgc;
  String healthStatus;
  String quaruantined;
  String dateOnset;
  String pregnantTab;

  Record({
    this.casesCode,
    this.age,
    this.ageGroup,
    this.sex,
    this.dateSpecimen,
    this.dateResultRelease,
    this.dateRepConf,
    this.dateDied,
    this.dateRecover,
    this.removalType,
    this.admitted,
    this.regionRes,
    this.provRes,
    this.cityMunRes,
    this.cityMuniPsgc,
    this.healthStatus,
    this.quaruantined,
    this.dateOnset,
    this.pregnantTab,
  });

  @override
  JsonBase fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Record(
      casesCode: map['case_code'],
      age: map['age'],
      ageGroup: map['age_group'],
      sex: map['sex'],
      dateSpecimen: map['date_specimen'],
      dateResultRelease: map['date_result_release'],
      dateRepConf: map['date_rep_conf'],
      dateDied: map['date_died'],
      dateRecover: map['date_recover'],
      removalType: map['removal_type'],
      admitted: map['admitted'],
      regionRes: map['region_res'],
      provRes: map['prov_res'],
      cityMunRes: map['city_mun_res'],
      cityMuniPsgc: map['city_muni_psgc'],
      healthStatus: map['health_status'],
      quaruantined: map['quarantined'],
      dateOnset: map['date_onset'],
      pregnantTab: map['pregnant_tab'],
    );
  }

  @override
  getData() {
    return this;
  }

  @override
  String toString() {
    return 'Record(cases_code: $casesCode, age: $age, age_group: $ageGroup, sex: $sex, date_specimen: $dateSpecimen, date_result_release: $dateResultRelease, date_rep_conf: $dateRepConf, date_died: $dateDied, date_recover: $dateRecover, removal_type: $removalType, admitted: $admitted, region_res: $regionRes, prov_res: $provRes, city_mun_res: $cityMunRes, city_muni_psgc: $cityMuniPsgc, health_status: $healthStatus, quaruantined: $quaruantined, date_onset: $dateOnset, pregnant_tab: $pregnantTab)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Record &&
        o.casesCode == casesCode &&
        o.age == age &&
        o.ageGroup == ageGroup &&
        o.sex == sex &&
        o.dateSpecimen == dateSpecimen &&
        o.dateResultRelease == dateResultRelease &&
        o.dateRepConf == dateRepConf &&
        o.dateDied == dateDied &&
        o.dateRecover == dateRecover &&
        o.removalType == removalType &&
        o.admitted == admitted &&
        o.regionRes == regionRes &&
        o.provRes == provRes &&
        o.cityMunRes == cityMunRes &&
        o.cityMuniPsgc == cityMuniPsgc &&
        o.healthStatus == healthStatus &&
        o.quaruantined == quaruantined &&
        o.dateOnset == dateOnset &&
        o.pregnantTab == pregnantTab;
  }

  @override
  int get hashCode {
    return casesCode.hashCode ^
        age.hashCode ^
        ageGroup.hashCode ^
        sex.hashCode ^
        dateSpecimen.hashCode ^
        dateResultRelease.hashCode ^
        dateRepConf.hashCode ^
        dateDied.hashCode ^
        dateRecover.hashCode ^
        removalType.hashCode ^
        admitted.hashCode ^
        regionRes.hashCode ^
        provRes.hashCode ^
        cityMunRes.hashCode ^
        cityMuniPsgc.hashCode ^
        healthStatus.hashCode ^
        quaruantined.hashCode ^
        dateOnset.hashCode ^
        pregnantTab.hashCode;
  }
}
