import 'package:flutter/material.dart';

class tColorConst {
  static const Color backgroundOnboarding = Color(0xff97b9f8);
}

class tTextStyle {
  static const TextStyle cate = TextStyle(
    fontSize: 14,
    color: Color(0xff6c7884),
  );
  static const TextStyle cateActive = TextStyle(
    fontSize: 14,
    color: Color(0xfffffaff),
  );
  static const TextStyle titleAppbar = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleAlertDialog = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}

Widget getSizeboxHeight(context, radio) {
  final h = MediaQuery.sizeOf(context).height * radio;
  return SizedBox(
    height: h,
  );
}

Widget getSizeboxWidth(context, radio) {
  final h = MediaQuery.sizeOf(context).height * radio;
  return SizedBox(
    width: h,
  );
}
