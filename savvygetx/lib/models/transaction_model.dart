// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionModel {
  String name;
  String value;
  String type;
  String cateId;
  String note;
  DateTime time;
  TransactionModel({
    required this.name,
    required this.value,
    required this.type,
    required this.cateId,
    required this.note,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'value': value,
      'type': type,
      'cateId': cateId,
      'note': note,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      name: map['name'] as String,
      value: map['value'] as String,
      type: map['type'] as String,
      cateId: map['cateId'] as String,
      note: map['note'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
