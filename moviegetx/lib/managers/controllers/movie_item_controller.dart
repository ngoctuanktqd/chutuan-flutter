import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/models/movie_model.dart';

//class MovieItemController extends GetxController with StateMixin {}
class MovieItemController extends GetxController {
  // chuyen huong
  goToMovieDetail(MovieModel item) {
    Get.toNamed(RouterName.movieDetail, arguments: item);
  }
}
