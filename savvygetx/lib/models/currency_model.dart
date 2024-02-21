import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CurrencyModel {
  String code;
  String name;
  String country;
  String countryCode;
  String? flag;
  CurrencyModel({
    required this.code,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.flag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'country': country,
      'countryCode': countryCode,
      'flag': flag,
    };
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
      code: map['code'] as String,
      name: map['name'] as String,
      country: map['country'] as String,
      countryCode: map['countryCode'] as String,
      flag: map['flag'] != null ? map['flag'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrencyModel.fromJson(String source) =>
      CurrencyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
