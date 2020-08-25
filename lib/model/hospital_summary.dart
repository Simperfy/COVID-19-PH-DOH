import 'dart:convert';

import 'package:Covid19_PH/model/base/jsonBase.dart';

class HospitalSummary implements JsonBase {
  int totalFacilities;
  double occupanyRate;
  int totalVacant;
  int totalOccupied;

  int icuVacant;
  int icuOccupied;
  int isolbedVacant;
  int isolbedOccupied;
  int bedwardVacant;
  int bedwardOccupied;
  int mechventVacant;
  int mechventOccupied;

  int icuVacantNc;
  int icuOccupiedNc;
  int nonIcuVacantNc;
  int nonIcuOccupiedNc;
  int mechventVacantNc;
  int mechventOccupiedNc;

  HospitalSummary({
    this.totalFacilities,
    this.occupanyRate,
    this.totalVacant,
    this.totalOccupied,
    this.icuVacant,
    this.icuOccupied,
    this.isolbedVacant,
    this.isolbedOccupied,
    this.bedwardVacant,
    this.bedwardOccupied,
    this.mechventVacant,
    this.mechventOccupied,
    this.icuVacantNc,
    this.icuOccupiedNc,
    this.nonIcuVacantNc,
    this.nonIcuOccupiedNc,
    this.mechventVacantNc,
    this.mechventOccupiedNc,
  });

  @override
  JsonBase fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return HospitalSummary(
      totalFacilities: map['data']['total_facilities'],
      occupanyRate: map['data']['occupancy_rate'],
      totalVacant: map['data']['beds']['total_vacant'],
      totalOccupied: map['data']['beds']['total_occupied'],
      icuVacant: map['data']['beds']['covid']['icu_v'],
      icuOccupied: map['data']['beds']['covid']['icu_o'],
      isolbedVacant: map['data']['beds']['covid']['isolbed_v'],
      isolbedOccupied: map['data']['beds']['covid']['isolbed_o'],
      bedwardVacant: map['data']['beds']['covid']['beds_ward_v'],
      bedwardOccupied: map['data']['beds']['covid']['beds_ward_o'],
      mechventVacant: map['data']['equipments']['mechvent_v'],
      mechventOccupied: map['data']['equipments']['mechvent_o'],
      icuVacantNc: map['data']['beds']['non_covid']['icu_v_nc'],
      icuOccupiedNc: map['data']['beds']['non_covid']['icu_o_nc'],
      nonIcuVacantNc: map['data']['beds']['non_covid']['nonicu_v_nc'],
      nonIcuOccupiedNc: map['data']['beds']['non_covid']['nonicu_o_nc'],
      mechventVacantNc: map['data']['equipments']['mechvent_v_nc'],
      mechventOccupiedNc: map['data']['equipments']['mechvent_o_nc'],
    );
  }

  @override
  String toString() {
    return 'HospitalSummary(totalFacilities: $totalFacilities, occupanyRate: $occupanyRate, totalVacant: $totalVacant, totalOccupied: $totalOccupied, icuVacant: $icuVacant, icuOccupied: $icuOccupied, isolbedVacant: $isolbedVacant, isolbedOccupied: $isolbedOccupied, bedwardVacant: $bedwardVacant, bedwardOccupied: $bedwardOccupied, mechventVacant: $mechventVacant, mechventOccupied: $mechventOccupied, icuVacantNc: $icuVacantNc, icuOccupiedNc: $icuOccupiedNc, nonIcuVacantNc: $nonIcuVacantNc, nonIcuOccupiedNc: $nonIcuOccupiedNc, mechventVacantNc: $mechventVacantNc, mechventOccupiedNc: $mechventOccupiedNc)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HospitalSummary &&
        o.totalFacilities == totalFacilities &&
        o.occupanyRate == occupanyRate &&
        o.totalVacant == totalVacant &&
        o.totalOccupied == totalOccupied &&
        o.icuVacant == icuVacant &&
        o.icuOccupied == icuOccupied &&
        o.isolbedVacant == isolbedVacant &&
        o.isolbedOccupied == isolbedOccupied &&
        o.bedwardVacant == bedwardVacant &&
        o.bedwardOccupied == bedwardOccupied &&
        o.mechventVacant == mechventVacant &&
        o.mechventOccupied == mechventOccupied &&
        o.icuVacantNc == icuVacantNc &&
        o.icuOccupiedNc == icuOccupiedNc &&
        o.nonIcuVacantNc == nonIcuVacantNc &&
        o.nonIcuOccupiedNc == nonIcuOccupiedNc &&
        o.mechventVacantNc == mechventVacantNc &&
        o.mechventOccupiedNc == mechventOccupiedNc;
  }

  @override
  int get hashCode {
    return totalFacilities.hashCode ^
        occupanyRate.hashCode ^
        totalVacant.hashCode ^
        totalOccupied.hashCode ^
        icuVacant.hashCode ^
        icuOccupied.hashCode ^
        isolbedVacant.hashCode ^
        isolbedOccupied.hashCode ^
        bedwardVacant.hashCode ^
        bedwardOccupied.hashCode ^
        mechventVacant.hashCode ^
        mechventOccupied.hashCode ^
        icuVacantNc.hashCode ^
        icuOccupiedNc.hashCode ^
        nonIcuVacantNc.hashCode ^
        nonIcuOccupiedNc.hashCode ^
        mechventVacantNc.hashCode ^
        mechventOccupiedNc.hashCode;
  }

  @override
  getData() => this;
}
