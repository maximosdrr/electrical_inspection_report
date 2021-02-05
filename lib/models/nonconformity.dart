import 'dart:convert';

class Nonconformity {
  String index;
  String requirement;
  String cases;
  String correction;
  Nonconformity({
    this.index,
    this.requirement,
    this.cases,
    this.correction,
  });

  Nonconformity copyWith({
    String index,
    String requirement,
    String cases,
    String correction,
  }) {
    return Nonconformity(
      index: index ?? this.index,
      requirement: requirement ?? this.requirement,
      cases: cases ?? this.cases,
      correction: correction ?? this.correction,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'requirement': requirement,
      'cases': cases,
      'correction': correction,
    };
  }

  factory Nonconformity.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Nonconformity(
      index: map['index'],
      requirement: map['requirement'],
      cases: map['cases'],
      correction: map['correction'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Nonconformity.fromJson(String source) =>
      Nonconformity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Nonconformity(index: $index, requirement: $requirement, cases: $cases, correction: $correction)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Nonconformity &&
        o.index == index &&
        o.requirement == requirement &&
        o.cases == cases &&
        o.correction == correction;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        requirement.hashCode ^
        cases.hashCode ^
        correction.hashCode;
  }
}
