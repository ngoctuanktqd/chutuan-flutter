// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:savvygetx/models/wallet_type_model.dart';

class ClassName {
  String name;
  double goal;
  double start;
  WalletTypeModel type;
  ClassName({
    required this.name,
    required this.goal,
    required this.start,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'goal': goal,
      'start': start,
      'type': type.toMap(),
    };
  }

  factory ClassName.fromMap(Map<String, dynamic> map) {
    return ClassName(
      name: map['name'] as String,
      goal: map['goal'] as double,
      start: map['start'] as double,
      type: WalletTypeModel.fromMap(map['type'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassName.fromJson(String source) =>
      ClassName.fromMap(json.decode(source) as Map<String, dynamic>);
}
