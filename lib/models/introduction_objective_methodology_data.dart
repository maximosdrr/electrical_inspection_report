import 'dart:convert';

import 'package:flutter/foundation.dart';

class IntroductionObjectiveMethodologyPageData {
  List<String> introductionParagraphs;
  List<String> objectiveParagraphs;
  List<String> methodologyParagraphs;
  IntroductionObjectiveMethodologyPageData({
    this.introductionParagraphs,
    this.objectiveParagraphs,
    this.methodologyParagraphs,
  });

  IntroductionObjectiveMethodologyPageData copyWith({
    List<String> introductionParagraphs,
    List<String> objectiveParagraphs,
    List<String> methodologyParagraphs,
  }) {
    return IntroductionObjectiveMethodologyPageData(
      introductionParagraphs:
          introductionParagraphs ?? this.introductionParagraphs,
      objectiveParagraphs: objectiveParagraphs ?? this.objectiveParagraphs,
      methodologyParagraphs:
          methodologyParagraphs ?? this.methodologyParagraphs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'introductionParagraphs': introductionParagraphs,
      'objectiveParagraphs': objectiveParagraphs,
      'methodologyParagraphs': methodologyParagraphs,
    };
  }

  factory IntroductionObjectiveMethodologyPageData.fromMap(
      Map<String, dynamic> map) {
    if (map == null) return null;

    return IntroductionObjectiveMethodologyPageData(
      introductionParagraphs: List<String>.from(map['introductionParagraphs']),
      objectiveParagraphs: List<String>.from(map['objectiveParagraphs']),
      methodologyParagraphs: List<String>.from(map['methodologyParagraphs']),
    );
  }

  String toJson() => json.encode(toMap());

  factory IntroductionObjectiveMethodologyPageData.fromJson(String source) =>
      IntroductionObjectiveMethodologyPageData.fromMap(json.decode(source));

  @override
  String toString() =>
      'IntroductionObjectiveMethodologyPageData(introductionParagraphs: $introductionParagraphs, objectiveParagraphs: $objectiveParagraphs, methodologyParagraphs: $methodologyParagraphs)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is IntroductionObjectiveMethodologyPageData &&
        listEquals(o.introductionParagraphs, introductionParagraphs) &&
        listEquals(o.objectiveParagraphs, objectiveParagraphs) &&
        listEquals(o.methodologyParagraphs, methodologyParagraphs);
  }

  @override
  int get hashCode =>
      introductionParagraphs.hashCode ^
      objectiveParagraphs.hashCode ^
      methodologyParagraphs.hashCode;
}
