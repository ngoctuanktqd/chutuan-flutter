import 'package:get/get.dart';
import 'package:moviegetx/managers/connects/movie_connect.dart';
import 'package:moviegetx/managers/states/movie_new_release_state.dart';
import 'package:moviegetx/models/movie_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//class MovieNewReleaseController extends GetxController with StateMixin {}
class MovieNewReleaseController extends GetxController {
  final state = MovieNewReleaseState();
  @override
  void onInit() {
    state.listNewReleaseMovie = <MovieModel>[].obs;
    state.currentPage = 1.obs;
    super.onInit();
    getListMovie(state.currentPage.value);
  }

  getListMovie(int page) async {
    List dataMovie = await MovieConnect().getReleaseMovie(page);
    List listMovie = dataMovie.map((e) => MovieModel.fromMap(e)).toList();
    state.listNewReleaseMovie.addAll(listMovie);
  }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  onRefresh() async {
    // Simulate a network request or any asynchronous operation
    await Future.delayed(const Duration(seconds: 2));

    // Update the data or perform any other operations
    state.currentPage.value = 1;
    state.listNewReleaseMovie.clear();
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
    state.listNewReleaseMovie.refresh();
    // Complete the refreshing process
    refreshController.loadComplete();
  }
}
