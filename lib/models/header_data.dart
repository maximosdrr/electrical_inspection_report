import 'dart:convert';
import 'dart:io';

class HeaderData {
  File companyLogo;
  String title;
  String code;
  String review;
  String date;
  String page;
  HeaderData({
    this.companyLogo,
    this.title,
    this.code,
    this.review,
    this.date,
    this.page,
  });

  HeaderData copyWith({
    File companyLogo,
    String title,
    String code,
    String review,
    String date,
    String page,
  }) {
    return HeaderData(
      companyLogo: companyLogo ?? this.companyLogo,
      title: title ?? this.title,
      code: code ?? this.code,
      review: review ?? this.review,
      date: date ?? this.date,
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'companyLogo': companyLogo?.toMap(),
      'title': title,
      'code': code,
      'review': review,
      'date': date,
      'page': page,
    };
  }

  factory HeaderData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return HeaderData(
      // companyLogo: File.fromMap(map['companyLogo']),
      title: map['title'],
      code: map['code'],
      review: map['review'],
      date: map['date'],
      page: map['page'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HeaderData.fromJson(String source) =>
      HeaderData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HeaderData(companyLogo: $companyLogo, title: $title, code: $code, review: $review, date: $date, page: $page)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HeaderData &&
        o.companyLogo == companyLogo &&
        o.title == title &&
        o.code == code &&
        o.review == review &&
        o.date == date &&
        o.page == page;
  }

  @override
  int get hashCode {
    return companyLogo.hashCode ^
        title.hashCode ^
        code.hashCode ^
        review.hashCode ^
        date.hashCode ^
        page.hashCode;
  }
}
