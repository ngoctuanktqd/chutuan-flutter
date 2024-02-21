// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:savvygetx/models/cate_model.dart';

class HeadCateModel {
  int id;
  String name;
  List<CateModel>? listCate;
  HeadCateModel({
    required this.id,
    required this.name,
    this.listCate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'listCate': listCate?.map((x) => x.toMap()).toList(),
    };
  }

  factory HeadCateModel.fromMap(Map<String, dynamic> map) {
    return HeadCateModel(
      id: map['id'] as int,
      name: map['name'] as String,
      listCate: map['listCate'] != null
          ? List<CateModel>.from(
              (map['listCate'] as List<int>).map<CateModel?>(
                (x) => CateModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeadCateModel.fromJson(String source) =>
      HeadCateModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
