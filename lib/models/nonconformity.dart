import 'dart:convert';
import 'dart:io';

class Nonconformity {
  int index;
  String requirement;
  String cases;
  String correction;
  String nonConformity;
  File image;
  Nonconformity({
    this.index,
    this.requirement,
    this.cases,
    this.correction,
    this.nonConformity,
    this.image,
  });

  Nonconformity copyWith({
    int index,
    String requirement,
    String cases,
    String correction,
    String nonConformity,
    File image,
  }) {
    return Nonconformity(
      index: index ?? this.index,
      requirement: requirement ?? this.requirement,
      cases: cases ?? this.cases,
      correction: correction ?? this.correction,
      nonConformity: nonConformity ?? this.nonConformity,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'requirement': requirement,
      'cases': cases,
      'correction': correction,
      'nonConformity': nonConformity,
      // 'image': image?.toMap(),
    };
  }

  factory Nonconformity.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Nonconformity(
      index: map['index'],
      requirement: map['requirement'],
      cases: map['cases'],
      correction: map['correction'],
      nonConformity: map['nonConformity'],
      // image: File.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Nonconformity.fromJson(String source) =>
      Nonconformity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Nonconformity(index: $index, requirement: $requirement, cases: $cases, correction: $correction, nonConformity: $nonConformity, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Nonconformity &&
        o.index == index &&
        o.requirement == requirement &&
        o.cases == cases &&
        o.correction == correction &&
        o.nonConformity == nonConformity &&
        o.image == image;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        requirement.hashCode ^
        cases.hashCode ^
        correction.hashCode ^
        nonConformity.hashCode ^
        image.hashCode;
  }
}
