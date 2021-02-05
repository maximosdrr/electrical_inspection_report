import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:report_generator/models/nonconformity.dart';

class Room {
  String title;
  List<Nonconformity> nonConformitys;
  Room({
    this.title,
    this.nonConformitys,
  });

  Room copyWith({
    String title,
    List<Nonconformity> nonConformitys,
  }) {
    return Room(
      title: title ?? this.title,
      nonConformitys: nonConformitys ?? this.nonConformitys,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'nonConformitys': nonConformitys?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Room(
      title: map['title'],
      nonConformitys: List<Nonconformity>.from(
          map['nonConformitys']?.map((x) => Nonconformity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Room.fromJson(String source) => Room.fromMap(json.decode(source));

  @override
  String toString() => 'Room(title: $title, nonConformitys: $nonConformitys)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Room &&
        o.title == title &&
        listEquals(o.nonConformitys, nonConformitys);
  }

  @override
  int get hashCode => title.hashCode ^ nonConformitys.hashCode;
}
