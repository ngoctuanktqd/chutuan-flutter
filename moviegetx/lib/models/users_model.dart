import 'dart:convert';

import 'package:moviegetx/apps/ultills/consts.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String id;
  String? fullName;
  String? nickName;
  String email;
  String? phoneNumber;
  int? gender;
  String avatar;
  String? payment;
  String? myList;
  String? myGenre;
  String? firstLogin;
  String? setupNotification;
  UserModel({
    required this.id,
    this.fullName,
    this.nickName,
    required this.email,
    this.phoneNumber,
    this.gender,
    this.avatar = MovieImage.avatar,
    this.payment,
    this.myList,
    this.myGenre,
    this.firstLogin,
    this.setupNotification,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'nickName': nickName,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'avatar': avatar,
      'payment': payment,
      'myList': myList,
      'myGenre': myGenre,
      'firstLogin': firstLogin,
      'setupNotification': setupNotification,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      nickName: map['nickName'] != null ? map['nickName'] as String : null,
      email: map['email'] as String,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      gender: map['gender'] != null ? map['gender'] as int : null,
      avatar: map['avatar'] as String,
      payment: map['payment'] != null ? map['payment'] as String : null,
      myList: map['myList'] != null ? map['myList'] as String : null,
      myGenre: map['myGenre'] != null ? map['myGenre'] as String : null,
      firstLogin:
          map['firstLogin'] != null ? map['firstLogin'] as String : null,
      setupNotification: map['setupNotification'] != null
          ? map['setupNotification'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
