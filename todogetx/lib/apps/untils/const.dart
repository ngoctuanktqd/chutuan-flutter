import 'package:flutter/material.dart';

class TuConstantColor {
  static const Color mainColor = Color(0xff97b9f8);
  static const Color subColor = Color(0xff7dabf6);
  static const Color cancel = Color(0xffef92a4);
}

Widget getHeight(context, ratio) {
  double height = MediaQuery.sizeOf(context).height;
  return SizedBox(
    height: height * ratio,
  );
}

Widget getWidth(context, ratio) {
  double width = MediaQuery.sizeOf(context).width;
  return SizedBox(
    width: width * ratio,
  );
}
