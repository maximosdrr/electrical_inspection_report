import 'dart:convert';

import 'package:flutter/foundation.dart';

class LegalWarningPageData {
  String title;
  List<String> paragraphs;
  LegalWarningPageData({
    this.title,
    this.paragraphs,
  });

  LegalWarningPageData copyWith({
    String title,
    List<String> paragraphs,
  }) {
    return LegalWarningPageData(
      title: title ?? this.title,
      paragraphs: paragraphs ?? this.paragraphs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'paragraphs': paragraphs,
    };
  }

  factory LegalWarningPageData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LegalWarningPageData(
      title: map['title'],
      paragraphs: List<String>.from(map['paragraphs']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LegalWarningPageData.fromJson(String source) =>
      LegalWarningPageData.fromMap(json.decode(source));

  @override
  String toString() =>
      'LegalWarningPageData(title: $title, paragraphs: $paragraphs)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LegalWarningPageData &&
        o.title == title &&
        listEquals(o.paragraphs, paragraphs);
  }

  @override
  int get hashCode => title.hashCode ^ paragraphs.hashCode;
}
