import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/movie_top_controller.dart';

class MovieTopBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieTopController());
  }
}
