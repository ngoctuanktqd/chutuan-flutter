import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/movie_new_release_controller.dart';

class MovieNewReleaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieNewReleaseController());
  }
}
