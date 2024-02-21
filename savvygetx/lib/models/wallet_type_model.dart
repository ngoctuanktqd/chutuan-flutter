import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WalletTypeModel {
  String name;
  String svg;
  String content;
  String type;
  WalletTypeModel({
    required this.name,
    required this.svg,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'svg': svg,
      'content': content,
      'type': type,
    };
  }

  factory WalletTypeModel.fromMap(Map<String, dynamic> map) {
    return WalletTypeModel(
      name: map['name'] as String,
      svg: map['svg'] as String,
      content: map['content'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletTypeModel.fromJson(String source) =>
      WalletTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
