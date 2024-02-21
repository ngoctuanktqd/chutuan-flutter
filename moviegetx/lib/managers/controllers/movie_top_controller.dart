import 'package:get/get.dart';
import 'package:moviegetx/managers/connects/movie_connect.dart';
import 'package:moviegetx/managers/states/movie_top_state.dart';
import 'package:moviegetx/models/movie_model.dart';

//class MovieTopController extends GetxController with StateMixin {}
class MovieTopController extends GetxController {
  final state = MovieTopState();
  @override
  void onInit() {
    state.listTopMovie = <MovieModel>[].obs;
    // TODO: implement onInit
    super.onInit();
    getTopMovie();
  }

  getTopMovie() async {
    List listData = await MovieConnect().getTopWeekMovie();
    List listMovie = listData.map((e) => MovieModel.fromMap(e)).toList();
    state.listTopMovie.addAll(listMovie);
  }
}
