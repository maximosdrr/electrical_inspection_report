import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:report_generator/models/noncoformity_priority.dart';

class NonConformityPriorityPageData {
  List<NonconformityPriority> nonconformityPriorities;
  NonConformityPriorityPageData({
    this.nonconformityPriorities,
  });

  NonConformityPriorityPageData copyWith({
    List<NonconformityPriority> nonconformityPriorities,
  }) {
    return NonConformityPriorityPageData(
      nonconformityPriorities:
          nonconformityPriorities ?? this.nonconformityPriorities,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nonconformityPriorities':
          nonconformityPriorities?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory NonConformityPriorityPageData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NonConformityPriorityPageData(
      nonconformityPriorities: List<NonconformityPriority>.from(
          map['nonconformityPriorities']
              ?.map((x) => NonconformityPriority.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NonConformityPriorityPageData.fromJson(String source) =>
      NonConformityPriorityPageData.fromMap(json.decode(source));

  @override
  String toString() =>
      'NonConformityPriorityPageData(nonconformityPriorities: $nonconformityPriorities)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NonConformityPriorityPageData &&
        listEquals(o.nonconformityPriorities, nonconformityPriorities);
  }

  @override
  int get hashCode => nonconformityPriorities.hashCode;
}
