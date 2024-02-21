import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget getHeight(context, ratiot) {
  return SizedBox(
    height: MediaQuery.sizeOf(context).height * ratiot,
  );
}

Widget getWidth(context, ratiot) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * ratiot,
  );
}

Widget showLoadingData(context) {
  return LoadingAnimationWidget.threeArchedCircle(
    color: Colors.amber,
    size: 80,
  );
}

Widget showImageBase64(string) {
  if (string != null) {
    final UriData? data = Uri.parse(string).data;
    Uint8List? myImage = data?.contentAsBytes();
    return Image.memory(
      myImage!,
      height: 24.0,
    );
  }
  return const SizedBox.shrink();
}
