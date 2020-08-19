import 'base/jsonBase.dart';

class Hospital implements JsonBase {
  String hfHudCode;
  String cfName;
  String updatedDate;
  String addedDate;
  String reportDate;
  int icuV;
  int icuO;
  int isolbedV;
  int isolbedO;
  int bedsWardV;
  int bedsWardO;
  int mechventV;
  int mechventO;
  int icuVNc;
  int icuONc;
  int nonIcuVNc;
  int nonIcuONc;
  int mechventVNc;
  int mechventONc;
  int qNurse;
  int qDoctor;
  int qOther;
  int nurseAdm;
  int doctorAdm;
  int otherAdm;
  int suspAsym;
  int suspMild;
  int suspSevere;
  int suspCrit;
  int suspDied;
  int probAsym;
  int probMild;
  int probSevere;
  int probCrit;
  int probDied;
  int tPatientAdm;
  int tPatientEr;
  int tPatientIcu;
  int transTtmf;
  int discharged;
  String region;
  String regionPsgc;
  String province;
  String provincePsgc;
  String cityMun;
  String citiyMunPsgc;
  String northCoord;
  String eastCoord;

  Hospital({
    this.hfHudCode,
    this.cfName,
    this.updatedDate,
    this.addedDate,
    this.reportDate,
    this.icuV,
    this.icuO,
    this.isolbedV,
    this.isolbedO,
    this.bedsWardV,
    this.bedsWardO,
    this.mechventV,
    this.mechventO,
    this.icuVNc,
    this.icuONc,
    this.nonIcuVNc,
    this.nonIcuONc,
    this.mechventVNc,
    this.mechventONc,
    this.qNurse,
    this.qDoctor,
    this.qOther,
    this.nurseAdm,
    this.doctorAdm,
    this.otherAdm,
    this.suspAsym,
    this.suspMild,
    this.suspSevere,
    this.suspCrit,
    this.suspDied,
    this.probAsym,
    this.probMild,
    this.probSevere,
    this.probCrit,
    this.probDied,
    this.tPatientAdm,
    this.tPatientEr,
    this.tPatientIcu,
    this.transTtmf,
    this.discharged,
    this.region,
    this.regionPsgc,
    this.province,
    this.provincePsgc,
    this.cityMun,
    this.citiyMunPsgc,
    this.northCoord,
    this.eastCoord,
  });

  @override
  JsonBase fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Hospital(
      hfHudCode: map['hfhudcode'],
      cfName: map['cf_name'],
      updatedDate: map['updated_date'],
      addedDate: map['added_date'],
      reportDate: map['report_date'],
      icuV: map['icu_v'],
      icuO: map['icu_o'],
      isolbedV: map['isolbed_v'],
      isolbedO: map['isolbed_o'],
      bedsWardV: map['beds_ward_v'],
      bedsWardO: map['beds_ward_o'],
      mechventV: map['mechvent_v'],
      mechventO: map['mechvent_o'],
      icuVNc: map['icu_v_nc'],
      icuONc: map['icu_o_nc'],
      nonIcuVNc: map['nonicu_v_nc'],
      nonIcuONc: map['nonicu_o_nc'],
      mechventVNc: map['mechvent_v_nc'],
      mechventONc: map['mechvent_o_nc'],
      qNurse: map['q_nurse'],
      qDoctor: map['q_doctor'],
      qOther: map['q_other'],
      nurseAdm: map['nurse_adm'],
      doctorAdm: map['doctor_adm'],
      otherAdm: map['other_adm'],
      suspAsym: map['susp_asym'],
      suspMild: map['susp_mild'],
      suspSevere: map['susp_severe'],
      suspCrit: map['susp_crit'],
      suspDied: map['susp_died'],
      probAsym: map['prob_asym'],
      probMild: map['prob_mild'],
      probSevere: map['prob_severe'],
      probCrit: map['prob_crit'],
      probDied: map['prob_died'],
      tPatientAdm: map['t_patient_adm'],
      tPatientEr: map['t_patient_er'],
      tPatientIcu: map['t_patient_icu'],
      transTtmf: map['trans_ttmf'],
      discharged: map['discharged'],
      region: map['region'],
      regionPsgc: map['region_psgc'],
      province: map['province'],
      provincePsgc: map['province_psgc'],
      cityMun: map['cityMun'],
      citiyMunPsgc: map['citiy_mun_psgc'],
      northCoord: map['north_coord'],
      eastCoord: map['east_coord'],
    );
  }

  @override
  getData() {
    return this;
  }

  @override
  String toString() {
    return 'Hospital(hfHudCode: $hfHudCode, cfName: $cfName, updatedDate: $updatedDate, addedDate: $addedDate, reportDate: $reportDate, icuV: $icuV, icuO: $icuO, isolbedV: $isolbedV, isolbedO: $isolbedO, bedsWardV: $bedsWardV, bedsWardO: $bedsWardO, mechventV: $mechventV, mechventO: $mechventO, icuVNc: $icuVNc, icuONc: $icuONc, nonIcuVNc: $nonIcuVNc, nonIcuONc: $nonIcuONc, mechventVNc: $mechventVNc, mechventONc: $mechventONc, qNurse: $qNurse, qDoctor: $qDoctor, qOther: $qOther, nurseAdm: $nurseAdm, doctorAdm: $doctorAdm, otherAdm: $otherAdm, suspAsym: $suspAsym, suspMild: $suspMild, suspSevere: $suspSevere, suspCrit: $suspCrit, suspDied: $suspDied, probAsym: $probAsym, probMild: $probMild, probSevere: $probSevere, probCrit: $probCrit, probDied: $probDied, tPatientAdm: $tPatientAdm, tPatientEr: $tPatientEr, tPatientIcu: $tPatientIcu, transTtmf: $transTtmf, discharged: $discharged, region: $region, regionPsgc: $regionPsgc, province: $province, provincePsgc: $provincePsgc, cityMun: $cityMun, citiyMunPsgc: $citiyMunPsgc, northCoord: $northCoord, eastCoord: $eastCoord)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Hospital &&
        o.hfHudCode == hfHudCode &&
        o.cfName == cfName &&
        o.updatedDate == updatedDate &&
        o.addedDate == addedDate &&
        o.reportDate == reportDate &&
        o.icuV == icuV &&
        o.icuO == icuO &&
        o.isolbedV == isolbedV &&
        o.isolbedO == isolbedO &&
        o.bedsWardV == bedsWardV &&
        o.bedsWardO == bedsWardO &&
        o.mechventV == mechventV &&
        o.mechventO == mechventO &&
        o.icuVNc == icuVNc &&
        o.icuONc == icuONc &&
        o.nonIcuVNc == nonIcuVNc &&
        o.nonIcuONc == nonIcuONc &&
        o.mechventVNc == mechventVNc &&
        o.mechventONc == mechventONc &&
        o.qNurse == qNurse &&
        o.qDoctor == qDoctor &&
        o.qOther == qOther &&
        o.nurseAdm == nurseAdm &&
        o.doctorAdm == doctorAdm &&
        o.otherAdm == otherAdm &&
        o.suspAsym == suspAsym &&
        o.suspMild == suspMild &&
        o.suspSevere == suspSevere &&
        o.suspCrit == suspCrit &&
        o.suspDied == suspDied &&
        o.probAsym == probAsym &&
        o.probMild == probMild &&
        o.probSevere == probSevere &&
        o.probCrit == probCrit &&
        o.probDied == probDied &&
        o.tPatientAdm == tPatientAdm &&
        o.tPatientEr == tPatientEr &&
        o.tPatientIcu == tPatientIcu &&
        o.transTtmf == transTtmf &&
        o.discharged == discharged &&
        o.region == region &&
        o.regionPsgc == regionPsgc &&
        o.province == province &&
        o.provincePsgc == provincePsgc &&
        o.cityMun == cityMun &&
        o.citiyMunPsgc == citiyMunPsgc &&
        o.northCoord == northCoord &&
        o.eastCoord == eastCoord;
  }

  @override
  int get hashCode {
    return hfHudCode.hashCode ^
        cfName.hashCode ^
        updatedDate.hashCode ^
        addedDate.hashCode ^
        reportDate.hashCode ^
        icuV.hashCode ^
        icuO.hashCode ^
        isolbedV.hashCode ^
        isolbedO.hashCode ^
        bedsWardV.hashCode ^
        bedsWardO.hashCode ^
        mechventV.hashCode ^
        mechventO.hashCode ^
        icuVNc.hashCode ^
        icuONc.hashCode ^
        nonIcuVNc.hashCode ^
        nonIcuONc.hashCode ^
        mechventVNc.hashCode ^
        mechventONc.hashCode ^
        qNurse.hashCode ^
        qDoctor.hashCode ^
        qOther.hashCode ^
        nurseAdm.hashCode ^
        doctorAdm.hashCode ^
        otherAdm.hashCode ^
        suspAsym.hashCode ^
        suspMild.hashCode ^
        suspSevere.hashCode ^
        suspCrit.hashCode ^
        suspDied.hashCode ^
        probAsym.hashCode ^
        probMild.hashCode ^
        probSevere.hashCode ^
        probCrit.hashCode ^
        probDied.hashCode ^
        tPatientAdm.hashCode ^
        tPatientEr.hashCode ^
        tPatientIcu.hashCode ^
        transTtmf.hashCode ^
        discharged.hashCode ^
        region.hashCode ^
        regionPsgc.hashCode ^
        province.hashCode ^
        provincePsgc.hashCode ^
        cityMun.hashCode ^
        citiyMunPsgc.hashCode ^
        northCoord.hashCode ^
        eastCoord.hashCode;
  }
}
