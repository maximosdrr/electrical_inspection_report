import 'dart:convert';
import 'dart:io';

class IntroPageData {
  String title;
  String subtitle;
  String year;
  String company;
  File logo;
  IntroPageData({
    this.title,
    this.subtitle,
    this.year,
    this.company,
    this.logo,
  });

  IntroPageData copyWith({
    String title,
    String subtitle,
    String year,
    String company,
    File logo,
  }) {
    return IntroPageData(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      year: year ?? this.year,
      company: company ?? this.company,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'year': year,
      'company': company,
      // 'logo': logo?.toMap(),
    };
  }

  factory IntroPageData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return IntroPageData(
      title: map['title'],
      subtitle: map['subtitle'],
      year: map['year'],
      company: map['company'],
      // logo: File.fromMap(map['logo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory IntroPageData.fromJson(String source) =>
      IntroPageData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'IntroPageData(title: $title, subtitle: $subtitle, year: $year, company: $company, logo: $logo)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is IntroPageData &&
        o.title == title &&
        o.subtitle == subtitle &&
        o.year == year &&
        o.company == company &&
        o.logo == logo;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        year.hashCode ^
        company.hashCode ^
        logo.hashCode;
  }
}
