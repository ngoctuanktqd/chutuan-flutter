import 'dart:convert';

import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CateModel {
  int id;
  Color color = Colors.blue;
  String name;
  int countTask = 0;
  CateModel({
    required this.id,
    required this.color,
    required this.name,
    required this.countTask,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color.value,
      'name': name,
      'countTask': countTask,
    };
  }

  factory CateModel.fromMap(Map<String, dynamic> map) {
    return CateModel(
      id: map['id'] as int,
      color: Color(map['color'] as int),
      name: map['name'] as String,
      countTask: map['countTask'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CateModel.fromJson(String source) =>
      CateModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
