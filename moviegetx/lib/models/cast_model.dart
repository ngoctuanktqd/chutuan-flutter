// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CastModel {
  int gender;
  int id;
  String? known_for_department;
  String name;
  String? original_name;
  int? popurlarity;
  String? profile_path;
  int cast_id;
  String? character;
  String credit_id;
  int order;
  CastModel({
    required this.gender,
    required this.id,
    this.known_for_department,
    required this.name,
    this.original_name,
    required this.popurlarity,
    this.profile_path,
    required this.cast_id,
    this.character,
    required this.credit_id,
    required this.order,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gender': gender,
      'id': id,
      'known_for_department': known_for_department,
      'name': name,
      'original_name': original_name,
      'popurlarity': popurlarity,
      'profile_path': profile_path,
      'cast_id': cast_id,
      'character': character,
      'credit_id': credit_id,
      'order': order,
    };
  }

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      gender: map['gender'] as int,
      id: map['id'] as int,
      known_for_department: map['known_for_department'] != null
          ? map['known_for_department'] as String
          : null,
      name: map['name'] as String,
      original_name:
          map['original_name'] != null ? map['original_name'] as String : null,
      popurlarity: map['popurlarity'] == null ? 0 : map['popurlarity'] as int,
      profile_path: map['profile_path'] != null
          ? map['profile_path'] as String
          : '/rHDHSx4g4nHU2BzXIB8LuMBx7Qk.jpg',
      cast_id: map['cast_id'] as int,
      character: map['character'] != null ? map['character'] as String : null,
      credit_id: map['credit_id'] as String,
      order: map['order'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CastModel.fromJson(String source) =>
      CastModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
