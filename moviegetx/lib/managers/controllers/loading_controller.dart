import 'dart:async';

import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/managers/states/loading_state.dart';

class LoadingController extends GetxController {
  final state = LoadingState();
  @override
  void onInit() async {
    state.progress = 0.0.obs;

    // TODO: implement onInit
    super.onInit();
    loadingProgess();
    // getBookmark();
  }

  // Xu. ly %
  loadingProgess() {
    const duration = Duration(milliseconds: 100);
    Timer.periodic(duration, (Timer timer) {
      if (state.progress.value < 1.0) {
        // double.parse(state.progress.value += 0.1);
        double newProgress = state.progress.value + 0.2;
        state.progress.value = double.parse(newProgress.toStringAsFixed(2));
        // Navigate to the next screen or perform any other action
        // after the loading is complete
      } else {
        timer.cancel();
        Timer.periodic(const Duration(seconds: 2), (timer) {
          timer.cancel();
          goToWellcome();
        });
      }
    });
  }

// chuyen huong
  goToWellcome() {
    Get.offAndToNamed(RouterName.wellcome);
  }
}
