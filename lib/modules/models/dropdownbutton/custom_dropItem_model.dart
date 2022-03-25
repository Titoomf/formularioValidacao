import 'dart:convert';

class CustomDropItem {
  final String image;
  final String text;
  CustomDropItem({
    required this.image,
    required this.text,
  });

  CustomDropItem copyWith({
    String? image,
    String? text,
  }) {
    return CustomDropItem(
      image: image ?? this.image,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'text': text,
    };
  }

  factory CustomDropItem.fromMap(Map<String, dynamic> map) {
    return CustomDropItem(
      image: map['image'] ?? '',
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomDropItem.fromJson(String source) =>
      CustomDropItem.fromMap(json.decode(source));
}
