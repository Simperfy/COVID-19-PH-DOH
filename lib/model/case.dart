
class Case {
  int cases;
  String date;
  Case({
    this.cases,
    this.date,
  });

  factory Case.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Case(
      cases: map['cases'],
      date: map['date'],
    );
  }

  @override
  String toString() => 'Case(cases: $cases, date: $date)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Case && o.cases == cases && o.date == date;
  }

  @override
  int get hashCode => cases.hashCode ^ date.hashCode;
}
