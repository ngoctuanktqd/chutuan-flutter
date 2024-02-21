// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class CateModel {
  String id;
  String name;
  int headCateId;
  IconData icon;
  Color color;
  CateModel({
    required this.id,
    required this.name,
    required this.headCateId,
    required this.icon,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'headCateId': headCateId,
      'icon': icon.codePoint,
      'color': color.value,
    };
  }

  factory CateModel.fromMap(Map<String, dynamic> map) {
    return CateModel(
      id: map['id'] as String,
      name: map['name'] as String,
      headCateId: map['headCateId'] as int,
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CateModel.fromJson(String source) =>
      CateModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
