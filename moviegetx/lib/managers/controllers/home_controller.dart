import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/managers/connects/movie_connect.dart';
import 'package:moviegetx/managers/states/home_state.dart';
import 'package:moviegetx/models/movie_model.dart';

// class HomeController extends GetxController with StateMixin {
class HomeController extends GetxController {
  final state = HomeState();
  @override
  void onInit() async {
    state.listTopWeekMovie = <MovieModel>[].obs;
    state.listNewReleaseMovie = <MovieModel>[].obs;
    state.listNowPlayingMovie = <MovieModel>[].obs;
    state.movieTopRated = MovieModel(
      adult: false,
      backdrop_path: 'backdrop_path',
      id: 0,
      title: 'title',
      original_title: 'original_title',
      overview: 'overview',
      poster_path: 'poster_path',
      genre_ids: [],
      popularity: 0,
      video: false,
      vote_average: 0,
      vote_count: 0,
    ).obs;
    // TODO: implement onInit
    super.onInit();
    await getListTopWeekMovie();
    await getNewReleaseMovie();
    await getListNowPlayingMovie();
    await getMovieTopRated();
    print(state.movieTopRated);
  }

  // Lay du lieu
  getMovieTopRated() async {
    List data = await MovieConnect().getTopRated(1);
    List listData = data.map((e) => MovieModel.fromMap(e)).toList();
    state.movieTopRated.value = listData[0];
  }

  getListTopWeekMovie() async {
    List topWeekMovie = await MovieConnect().getTopWeekMovie();
    List listData = topWeekMovie.map((e) => MovieModel.fromMap(e)).toList();
    state.listTopWeekMovie.addAll(listData);
  }

  getNewReleaseMovie() async {
    List newReleaseMovie = await MovieConnect().getReleaseMovie(1);

    List listData = newReleaseMovie.map((e) => MovieModel.fromMap(e)).toList();
    state.listNewReleaseMovie.addAll(listData);
    // change(listData, status: RxStatus.success());
  }

  getListNowPlayingMovie() async {
    List listData = await MovieConnect().getNowPlaying(1);
    List listMovie = listData.map((e) => MovieModel.fromMap(e)).toList();
    state.listNowPlayingMovie.addAll(listMovie);
  }

  // chuyen huong
  goToNewReleaseMovie() {
    Get.toNamed(RouterName.movieNewRelease);
  }

  goToTopMovie() {
    Get.toNamed(RouterName.movieTop);
  }

  goToNowPlayingMovie() {
    Get.toNamed(RouterName.movieNowPlaying);
  }

  goToMovieRated() {
    Get.toNamed(RouterName.movieDetail, arguments: state.movieTopRated.value);
  }
}
