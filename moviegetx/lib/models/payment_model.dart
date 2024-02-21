import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentModel {
  String id;
  String logo;
  String namePayment;
  String email;
  String name;
  String number;
  String expired;
  String cvv;
  PaymentModel({
    required this.id,
    required this.logo,
    required this.namePayment,
    this.email = '',
    this.name = '',
    this.number = '',
    this.expired = '',
    this.cvv = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logo': logo,
      'namePayment': namePayment,
      'email': email,
      'name': name,
      'number': number,
      'expired': expired,
      'cvv': cvv,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      id: map['id'] as String,
      logo: map['logo'] as String,
      namePayment: map['namePayment'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      number: map['number'] as String,
      expired: map['expired'] as String,
      cvv: map['cvv'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) =>
      PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
