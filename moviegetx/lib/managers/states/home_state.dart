import 'package:get/get.dart';
import 'package:moviegetx/models/movie_model.dart';

class HomeState {
  late RxList listTopWeekMovie;
  late RxList listNewReleaseMovie;
  late RxList listNowPlayingMovie;
  late Rx<MovieModel> movieTopRated;
}
