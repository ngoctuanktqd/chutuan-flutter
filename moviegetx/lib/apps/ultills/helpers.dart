import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:moviegetx/apps/ultills/consts.dart';

Widget getWidth(context, ratiot) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * ratiot,
  );
}

Widget getHeight(context, ratiot) {
  return SizedBox(
    height: MediaQuery.sizeOf(context).height * ratiot,
  );
}

Widget showLoadingData(context) {
  return LoadingAnimationWidget.threeArchedCircle(
    color: Colors.amber,
    size: 80,
  );
}

Widget show404(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/404.png'),
        getHeight(context, 0.04),
        const Text(
          "Not Found",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: MovieColor.primary_500,
          ),
        ),
        getHeight(context, 0.04),
        const Text(
          "Sorry, the keyword you entered could not be found. Try to check again or search with other keywords.",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
