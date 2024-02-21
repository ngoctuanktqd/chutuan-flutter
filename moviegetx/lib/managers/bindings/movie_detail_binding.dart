import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/movie_detail_controller.dart';
import 'package:moviegetx/managers/controllers/my_list_controller.dart';

class MovieDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailController());
    Get.put(MyListController());
  }
}
