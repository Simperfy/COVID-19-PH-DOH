
class Summary {
  int total;
  int recoveries;
  int deaths;
  int activeCases;
  String fatalityRate;
  String recoveryRate;
  String lastUpdate;
  Summary({
    this.total,
    this.recoveries,
    this.deaths,
    this.activeCases,
    this.fatalityRate,
    this.recoveryRate,
    this.lastUpdate,
  });

  factory Summary.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Summary(
      total: map['data']['total'],
      recoveries: map['data']['recoveries'],
      deaths: map['data']['deaths'],
      activeCases: map['data']['active_cases'],
      fatalityRate: map['data']['fatality_rate'],
      recoveryRate: map['data']['recovery_rate'],
      lastUpdate: map['last_update'],
    );
  }

  @override
  String toString() {
    return 'Summary(total: $total, recoveries: $recoveries, deaths: $deaths, active_cases: $activeCases, fatality_rate: $fatalityRate, recovery_rate: $recoveryRate, last_update: $lastUpdate)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Summary &&
        o.total == total &&
        o.recoveries == recoveries &&
        o.deaths == deaths &&
        o.activeCases == activeCases &&
        o.fatalityRate == fatalityRate &&
        o.recoveryRate == recoveryRate &&
        o.lastUpdate == lastUpdate;
  }

  @override
  int get hashCode {
    return total.hashCode ^
        recoveries.hashCode ^
        deaths.hashCode ^
        activeCases.hashCode ^
        fatalityRate.hashCode ^
        recoveryRate.hashCode ^
        lastUpdate.hashCode;
  }
}
