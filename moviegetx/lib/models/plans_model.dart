import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlansModel {
  String name;
  double price;
  PlansModel({
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
    };
  }

  factory PlansModel.fromMap(Map<String, dynamic> map) {
    return PlansModel(
      name: map['name'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlansModel.fromJson(String source) =>
      PlansModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
