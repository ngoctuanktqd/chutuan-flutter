import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/movie_now_playing_controller.dart';

class MovieNowPlayingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieNowPlayingController());
  }
}
