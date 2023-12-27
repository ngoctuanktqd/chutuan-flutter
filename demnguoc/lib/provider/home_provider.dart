import 'dart:async';

import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final StreamController<int> _numberController =
      StreamController<int>.broadcast();

  Timer? time;

  int number = 90;

  Stream<int> get StreamNumber => _numberController.stream;

  void play() {
    if (time?.isActive == true) {
      return;
    }
    time = Timer.periodic(const Duration(seconds: 1), (_) {
      number--;
      _numberController.add(number);
    });
  }

  void pause() {
    time!.cancel();
  }

  void reset() {
    time!.cancel();
    number = 90;
    _numberController.add(number);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _numberController.close();
  }
}
