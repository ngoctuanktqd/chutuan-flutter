import 'package:get/get.dart';
import 'package:moviegetx/managers/connects/movie_connect.dart';
import 'package:moviegetx/managers/states/movie_now_playing_state.dart';
import 'package:moviegetx/models/movie_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//class MovieNowPlayingController extends GetxController with StateMixin {}
class MovieNowPlayingController extends GetxController {
  final state = MovieNowPlayingState();
  @override
  void onInit() {
    state.currentPage = 1.obs;
    state.listMovieNowPlaying = <MovieModel>[].obs;
    super.onInit();
    getListMovie(state.currentPage.value);
  }

  getListMovie(int page) async {
    List dataMovie = await MovieConnect().getNowPlaying(page);
    List listMovie = dataMovie.map((e) => MovieModel.fromMap(e)).toList();
    state.listMovieNowPlaying.addAll(listMovie);
  }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  onRefresh() async {
    // Simulate a network request or any asynchronous operation
    await Future.delayed(const Duration(seconds: 2));

    // Update the data or perform any other operations
    state.currentPage.value = 1;
    state.listMovieNowPlaying.clear();
    getListMovie(state.currentPage.value);
    // Complete the refreshing process
    refreshController.refreshCompleted();
  }

  onLoading() async {
    // Simulate a network request or any asynchronous operation
    await Future.delayed(const Duration(seconds: 2));
    // Update the data or perform any other operations
    state.currentPage.value = state.currentPage.value + 1;
    getListMovie(state.currentPage.value);
    state.listMovieNowPlaying.refresh();
    // Complete the refreshing process
    refreshController.loadComplete();
  }
}
