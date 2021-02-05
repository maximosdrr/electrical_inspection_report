import 'dart:convert';

import 'package:flutter/foundation.dart';

class CompatyIdentificationData {
  String socialReason;
  String cnpj;
  String unity;
  String address;
  String cep;
  String county;
  String state;
  String companySite;
  List<String> contacts;
  List<String> emails;
  CompatyIdentificationData({
    this.socialReason,
    this.cnpj,
    this.unity,
    this.address,
    this.cep,
    this.county,
    this.state,
    this.companySite,
    this.contacts,
    this.emails,
  });

  CompatyIdentificationData copyWith({
    String socialReason,
    String cnpj,
    String unity,
    String address,
    String cep,
    String county,
    String state,
    String companySite,
    List<String> contacts,
    List<String> emails,
  }) {
    return CompatyIdentificationData(
      socialReason: socialReason ?? this.socialReason,
      cnpj: cnpj ?? this.cnpj,
      unity: unity ?? this.unity,
      address: address ?? this.address,
      cep: cep ?? this.cep,
      county: county ?? this.county,
      state: state ?? this.state,
      companySite: companySite ?? this.companySite,
      contacts: contacts ?? this.contacts,
      emails: emails ?? this.emails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'socialReason': socialReason,
      'cnpj': cnpj,
      'unity': unity,
      'address': address,
      'cep': cep,
      'county': county,
      'state': state,
      'companySite': companySite,
      'contacts': contacts,
      'emails': emails,
    };
  }

  factory CompatyIdentificationData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CompatyIdentificationData(
      socialReason: map['socialReason'],
      cnpj: map['cnpj'],
      unity: map['unity'],
      address: map['address'],
      cep: map['cep'],
      county: map['county'],
      state: map['state'],
      companySite: map['companySite'],
      contacts: List<String>.from(map['contacts']),
      emails: List<String>.from(map['emails']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompatyIdentificationData.fromJson(String source) =>
      CompatyIdentificationData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CompatyIdentificationData(socialReason: $socialReason, cnpj: $cnpj, unity: $unity, address: $address, cep: $cep, county: $county, state: $state, companySite: $companySite, contacts: $contacts, emails: $emails)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CompatyIdentificationData &&
        o.socialReason == socialReason &&
        o.cnpj == cnpj &&
        o.unity == unity &&
        o.address == address &&
        o.cep == cep &&
        o.county == county &&
        o.state == state &&
        o.companySite == companySite &&
        listEquals(o.contacts, contacts) &&
        listEquals(o.emails, emails);
  }

  @override
  int get hashCode {
    return socialReason.hashCode ^
        cnpj.hashCode ^
        unity.hashCode ^
        address.hashCode ^
        cep.hashCode ^
        county.hashCode ^
        state.hashCode ^
        companySite.hashCode ^
        contacts.hashCode ^
        emails.hashCode;
  }
}
