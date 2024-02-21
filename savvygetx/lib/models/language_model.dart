import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LanguageModel {
  int id;
  String name;
  bool active;
  LanguageModel({
    required this.id,
    required this.name,
    required this.active,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'active': active,
    };
  }

  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      id: map['id'] as int,
      name: map['name'] as String,
      active: map['active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LanguageModel.fromJson(String source) =>
      LanguageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
