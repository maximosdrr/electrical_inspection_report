import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class TreaceabilityPageData {
  String commercialProposal;
  String purchaseOrderNumber;
  String documentCode;
  String revision;
  String date;
  String period;
  String elaboration;
  String approval;
  String artNumber;
  File digitalSignature;
  List<String> monitoringofServices;
  TechnicalManager technicalManager;
  TreaceabilityPageData({
    this.commercialProposal,
    this.purchaseOrderNumber,
    this.documentCode,
    this.revision,
    this.date,
    this.period,
    this.elaboration,
    this.approval,
    this.artNumber,
    this.digitalSignature,
    this.monitoringofServices,
    this.technicalManager,
  });

  TreaceabilityPageData copyWith({
    String commercialProposal,
    String purchaseOrderNumber,
    String documentCode,
    String revision,
    String date,
    String period,
    String elaboration,
    String approval,
    String artNumber,
    File digitalSignature,
    List<String> monitoringofServices,
    TechnicalManager technicalManager,
  }) {
    return TreaceabilityPageData(
      commercialProposal: commercialProposal ?? this.commercialProposal,
      purchaseOrderNumber: purchaseOrderNumber ?? this.purchaseOrderNumber,
      documentCode: documentCode ?? this.documentCode,
      revision: revision ?? this.revision,
      date: date ?? this.date,
      period: period ?? this.period,
      elaboration: elaboration ?? this.elaboration,
      approval: approval ?? this.approval,
      artNumber: artNumber ?? this.artNumber,
      digitalSignature: digitalSignature ?? this.digitalSignature,
      monitoringofServices: monitoringofServices ?? this.monitoringofServices,
      technicalManager: technicalManager ?? this.technicalManager,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'commercialProposal': commercialProposal,
      'purchaseOrderNumber': purchaseOrderNumber,
      'documentCode': documentCode,
      'revision': revision,
      'date': date,
      'period': period,
      'elaboration': elaboration,
      'approval': approval,
      'artNumber': artNumber,
      // 'digitalSignature': digitalSignature?.toMap(),
      'monitoringofServices': monitoringofServices,
      'technicalManager': technicalManager?.toMap(),
    };
  }

  factory TreaceabilityPageData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TreaceabilityPageData(
      commercialProposal: map['commercialProposal'],
      purchaseOrderNumber: map['purchaseOrderNumber'],
      documentCode: map['documentCode'],
      revision: map['revision'],
      date: map['date'],
      period: map['period'],
      elaboration: map['elaboration'],
      approval: map['approval'],
      artNumber: map['artNumber'],
      // digitalSignature: File.fromMap(map['digitalSignature']),
      monitoringofServices: List<String>.from(map['monitoringofServices']),
      technicalManager: TechnicalManager.fromMap(map['technicalManager']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TreaceabilityPageData.fromJson(String source) =>
      TreaceabilityPageData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TreaceabilityPageData(commercialProposal: $commercialProposal, purchaseOrderNumber: $purchaseOrderNumber, documentCode: $documentCode, revision: $revision, date: $date, period: $period, elaboration: $elaboration, approval: $approval, artNumber: $artNumber, digitalSignature: $digitalSignature, monitoringofServices: $monitoringofServices, technicalManager: $technicalManager)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TreaceabilityPageData &&
        o.commercialProposal == commercialProposal &&
        o.purchaseOrderNumber == purchaseOrderNumber &&
        o.documentCode == documentCode &&
        o.revision == revision &&
        o.date == date &&
        o.period == period &&
        o.elaboration == elaboration &&
        o.approval == approval &&
        o.artNumber == artNumber &&
        o.digitalSignature == digitalSignature &&
        listEquals(o.monitoringofServices, monitoringofServices) &&
        o.technicalManager == technicalManager;
  }

  @override
  int get hashCode {
    return commercialProposal.hashCode ^
        purchaseOrderNumber.hashCode ^
        documentCode.hashCode ^
        revision.hashCode ^
        date.hashCode ^
        period.hashCode ^
        elaboration.hashCode ^
        approval.hashCode ^
        artNumber.hashCode ^
        digitalSignature.hashCode ^
        monitoringofServices.hashCode ^
        technicalManager.hashCode;
  }
}

class TechnicalManager {
  String name;
  String title;
  String crea;
  TechnicalManager({
    this.name,
    this.title,
    this.crea,
  });

  TechnicalManager copyWith({
    String name,
    String title,
    String crea,
  }) {
    return TechnicalManager(
      name: name ?? this.name,
      title: title ?? this.title,
      crea: crea ?? this.crea,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'crea': crea,
    };
  }

  factory TechnicalManager.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TechnicalManager(
      name: map['name'],
      title: map['title'],
      crea: map['crea'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TechnicalManager.fromJson(String source) =>
      TechnicalManager.fromMap(json.decode(source));

  @override
  String toString() =>
      'TechnicalManager(name: $name, title: $title, crea: $crea)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TechnicalManager &&
        o.name == name &&
        o.title == title &&
        o.crea == crea;
  }

  @override
  int get hashCode => name.hashCode ^ title.hashCode ^ crea.hashCode;
}
