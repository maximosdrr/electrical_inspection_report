import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:report_generator/models/floor.dart';

class NonConformityPageData {
  List<Floor> floors;
  NonConformityPageData({
    this.floors,
  });

  NonConformityPageData copyWith({
    List<Floor> floors,
  }) {
    return NonConformityPageData(
      floors: floors ?? this.floors,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'floors': floors?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory NonConformityPageData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NonConformityPageData(
      floors: List<Floor>.from(map['floors']?.map((x) => Floor.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NonConformityPageData.fromJson(String source) =>
      NonConformityPageData.fromMap(json.decode(source));

  @override
  String toString() => 'NonConformityPageData(floors: $floors)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NonConformityPageData && listEquals(o.floors, floors);
  }

  @override
  int get hashCode => floors.hashCode;
}
