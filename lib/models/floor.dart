import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:report_generator/models/room.dart';

class Floor {
  String title;
  int index;
  List<Room> rooms;
  Floor({
    this.title,
    this.index,
    this.rooms,
  });

  Floor copyWith({
    String title,
    int index,
    List<Room> rooms,
  }) {
    return Floor(
      title: title ?? this.title,
      index: index ?? this.index,
      rooms: rooms ?? this.rooms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'index': index,
      'rooms': rooms?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Floor.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Floor(
      title: map['title'],
      index: map['index'],
      rooms: List<Room>.from(map['rooms']?.map((x) => Room.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Floor.fromJson(String source) => Floor.fromMap(json.decode(source));

  @override
  String toString() => 'Floor(title: $title, index: $index, rooms: $rooms)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Floor &&
        o.title == title &&
        o.index == index &&
        listEquals(o.rooms, rooms);
  }

  @override
  int get hashCode => title.hashCode ^ index.hashCode ^ rooms.hashCode;
}
