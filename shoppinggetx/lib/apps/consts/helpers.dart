import 'package:flutter/material.dart';

Widget getHeight(context, ratio) {
  return SizedBox(
    height: MediaQuery.sizeOf(context).height * ratio,
  );
}

Widget getWidth(context, ratio) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * ratio,
  );
}
