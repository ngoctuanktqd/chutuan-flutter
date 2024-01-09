import 'dart:convert';

import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  int id;
  String name;
  String image;
  Color color;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'color': color.value,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
