import 'dart:convert';
import 'dart:io';

class NonconformityPriority {
  int index;
  String nonConformity;
  File image;
  NonconformityPriority({
    this.index,
    this.nonConformity,
    this.image,
  });

  NonconformityPriority copyWith({
    int index,
    String nonConformity,
    File image,
  }) {
    return NonconformityPriority(
      index: index ?? this.index,
      nonConformity: nonConformity ?? this.nonConformity,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'nonConformity': nonConformity,
      // 'image': image?.toMap(),
    };
  }

  factory NonconformityPriority.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NonconformityPriority(
      index: map['index'],
      nonConformity: map['nonConformity'],
      // image: File.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NonconformityPriority.fromJson(String source) =>
      NonconformityPriority.fromMap(json.decode(source));

  @override
  String toString() =>
      'NonconformityPriority(index: $index, nonConformity: $nonConformity, image: $image)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NonconformityPriority &&
        o.index == index &&
        o.nonConformity == nonConformity &&
        o.image == image;
  }

  @override
  int get hashCode => index.hashCode ^ nonConformity.hashCode ^ image.hashCode;
}
