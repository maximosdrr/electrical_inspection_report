import 'dart:convert';
import 'dart:io';

class FooterData {
  String webSite;
  File logo;
  File qrCode;
  FooterData({
    this.webSite,
    this.logo,
    this.qrCode,
  });

  FooterData copyWith({
    String webSite,
    File logo,
    File qrCode,
  }) {
    return FooterData(
      webSite: webSite ?? this.webSite,
      logo: logo ?? this.logo,
      qrCode: qrCode ?? this.qrCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'webSite': webSite,
      // 'logo': logo?.toMap(),
      // 'qrCode': qrCode?.toMap(),
    };
  }

  factory FooterData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FooterData(
      webSite: map['webSite'],
      // logo: File.fromMap(map['logo']),
      // qrCode: File.fromMap(map['qrCode']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FooterData.fromJson(String source) =>
      FooterData.fromMap(json.decode(source));

  @override
  String toString() =>
      'FooterData(webSite: $webSite, logo: $logo, qrCode: $qrCode)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FooterData &&
        o.webSite == webSite &&
        o.logo == logo &&
        o.qrCode == qrCode;
  }

  @override
  int get hashCode => webSite.hashCode ^ logo.hashCode ^ qrCode.hashCode;
}
