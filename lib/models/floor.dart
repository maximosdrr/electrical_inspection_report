import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:report_generator/models/room.dart';

class Floor {
  String title;
  List<Room> rooms;
  Floor({
    this.title,
    this.rooms,
  });

  Floor copyWith({
    String title,
    List<Room> rooms,
  }) {
    return Floor(
      title: title ?? this.title,
      rooms: rooms ?? this.rooms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'rooms': rooms?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Floor.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Floor(
      title: map['title'],
      rooms: List<Room>.from(map['rooms']?.map((x) => Room.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Floor.fromJson(String source) => Floor.fromMap(json.decode(source));

  @override
  String toString() => 'Floor(title: $title, rooms: $rooms)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Floor && o.title == title && listEquals(o.rooms, rooms);
  }

  @override
  int get hashCode => title.hashCode ^ rooms.hashCode;
}
