import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserInfoModel {
  String id;
  String userName;
  String email;
  String? avatar;
  UserInfoModel({
    required this.id,
    required this.userName,
    required this.email,
    this.avatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'email': email,
      'avatar': avatar,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      id: map['id'],
      userName: map['userName'] ?? '',
      email: map['email'],
      avatar: map['avatar'] ??
          'https://firebasestorage.googleapis.com/v0/b/shopping-18978.appspot.com/o/images%2Fava.jpeg?alt=media&token=8a3a769d-d817-43d5-9ee9-7bc476ba0470',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) =>
      UserInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
