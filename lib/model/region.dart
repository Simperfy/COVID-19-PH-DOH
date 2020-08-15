import 'dart:convert';

class Region {
  String region;
  int cases;
  Region({
    this.region,
    this.cases,
  });

  Region copyWith({
    String region,
    int cases,
  }) {
    return Region(
      region: region ?? this.region,
      cases: cases ?? this.cases,
    );
  }

  factory Region.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Region(
      region: map['region'],
      cases: map['cases'],
    );
  }

  factory Region.fromJson(String source) => Region.fromMap(json.decode(source));

  @override
  String toString() => 'Region(region: $region, cases: $cases)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Region && o.region == region && o.cases == cases;
  }

  @override
  int get hashCode => region.hashCode ^ cases.hashCode;
}
