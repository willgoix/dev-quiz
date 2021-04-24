import 'dart:convert';

class AwnserModel {
  final String title;
  final bool right;

  AwnserModel({
    required this.title,
    this.right = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'right': right,
    };
  }

  factory AwnserModel.fromMap(Map<String, dynamic> map) {
    return AwnserModel(
      title: map['title'], 
      right: map['right'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AwnserModel.fromJson(String source) => AwnserModel.fromMap(json.decode(source));
}
