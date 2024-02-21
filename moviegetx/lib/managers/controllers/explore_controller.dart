import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/functions.dart';
import 'package:moviegetx/managers/connects/movie_connect.dart';
import 'package:moviegetx/managers/states/explore_state.dart';
import 'package:moviegetx/models/movie_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//class ExploreController extends GetxController with StateMixin {}
class ExploreController extends GetxController {
  Timer? _debounce;
  final state = ExploreState();
  @override
  void onInit() async {
    state.currentPage = 1.obs;
    state.listMovieExplore = <MovieModel>[].obs;
    state.searchController = TextEditingController();
    state.searchController.text = '';

    // TODO: implement onInit
    await getList();
    super.onInit();
    state.searchController.addListener(getLiveSearch);
  }

  getList() async {
    if (state.searchController.text != '') {
      getListMovieSearch();
    } else {
      getListMovie();
    }
  }

  getListMovie() async {
    List dataMovie = await MovieConnect().getExplore(state.currentPage.value);
    List listMovie = dataMovie.map((e) => MovieModel.fromMap(e)).toList();

    state.listMovieExplore.addAll(listMovie);
  }

  getListMovieSearch() async {
    showLoading();
    List dataMovie = await MovieConnect()
        .getSearch(state.currentPage.value, state.searchController.text);
    List listMovie = dataMovie.map((e) => MovieModel.fromMap(e)).toList();
    state.listMovieExplore.addAll(listMovie);
    closeLoading();
  }

  getLiveSearch() async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 800), () {
      // Perform your search operation here
      state.currentPage.value = 1;
      state.listMovieExplore.clear();
      getList();
    });
  }

  // Rs

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  onRefresh() async {
    // Simulate a network request or any asynchronous operation
    await Future.delayed(const Duration(seconds: 2));

    // Update the data or perform any other operations

    state.currentPage.value = 1;
    state.listMovieExplore.clear();
    getList();
    // Complete the refreshing process
    refreshController.refreshCompleted();
  }

  onLoading() async {
    // Simulate a network request or any asynchronous operation
    await Future.delayed(const Duration(seconds: 2));
    // Update the data or perform any other operations
    state.currentPage.value++;
    getList();
    state.listMovieExplore.refresh();
    // Complete the refreshing process
    refreshController.loadComplete();
  }
}
