import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/managers/connects/movie_connect.dart';
import 'package:moviegetx/managers/states/movie_detail_state.dart';
import 'package:moviegetx/models/cast_model.dart';
import 'package:moviegetx/models/genre_model.dart';
import 'package:moviegetx/models/movie_model.dart';
import 'package:moviegetx/models/review_model.dart';
import 'package:moviegetx/models/trailler_model.dart';
import 'package:moviegetx/pages/movie_detail/movie_detail_review.dart';
import 'package:moviegetx/pages/movie_detail/movie_detail_similar.dart';
import 'package:moviegetx/pages/movie_detail/movie_detail_trailler.dart';

//class MovieDetailController extends GetxController with StateMixin {}
class MovieDetailController extends GetxController {
  final state = MovieDetailState();
  @override
  void onInit() async {
    state.showMore = false.obs;
    state.listTab = <Widget>[];
    state.currentTab = 0.obs;
    state.listCast = <CastModel>[].obs;
    state.listGenre = <GenreModel>[].obs;
    state.backgroundVideo = ''.obs;
    state.listTrailler = <TraillerModel>[].obs;
    state.listSimilar = <MovieModel>[].obs;
    state.listReview = <ReviewModel>[].obs;
    state.item = Get.arguments;
    // state.listBookmark = <MovieModel>[].obs;

    // TODO: implement onInit
    super.onInit();
    await setListTab();
    getDetail(state.item.id);
    // getBookmark();
  }

  // Get movie detail
  getDetail(id) async {
    final listData = await MovieConnect().getDetail(id);
    state.backgroundVideo.value = listData['backdrop_path'] ?? '';
    List listCast = listData?['credits']?['cast'];
    if (listCast.isNotEmpty) {
      state.listCast.clear();
      List dataCast = listCast.map((e) => CastModel.fromMap(e)).toList();
      state.listCast.addAll(dataCast);
    }
    List listGenre = listData?['genres'];
    if (listGenre.isNotEmpty) {
      state.listGenre.clear();
      List dataGenre = listGenre.map((e) => GenreModel.fromMap(e)).toList();
      state.listGenre.addAll(dataGenre);
    }
    List listTrailler = listData?['videos']?['results'];
    if (listTrailler.isNotEmpty) {
      state.listTrailler.clear();
      List dataTrailler =
          listTrailler.map((e) => TraillerModel.fromMap(e)).toList();
      state.listTrailler.addAll(dataTrailler);
    }
    List listSimilar = listData?['similar']?['results'];
    if (listSimilar.isNotEmpty) {
      state.listSimilar.clear();
      List dataSimilar = listSimilar.map((e) => MovieModel.fromMap(e)).toList();
      state.listSimilar.addAll(dataSimilar);
    }
    List listReview = listData?['reviews']?['results'];
    if (listReview.isNotEmpty) {
      state.listReview.clear();
      List dataReview = listReview.map((e) => ReviewModel.fromMap(e)).toList();
      state.listReview.addAll(dataReview);
    }
  }

  // Content detail
  setShowMoreContent() {
    state.showMore.value = !state.showMore.value;
  }

  // Danh sach yeu thich
  // getBookmark() {
  //   if (SharedService.to.getString(MyKey.listBookmark) != '') {
  //     List data = jsonDecode(SharedService.to.getString(MyKey.listBookmark));
  //     List listData = data.map((e) => MovieModel.fromJson(e)).toList();
  //     state.listBookmark.clear();
  //     state.listBookmark.addAll(listData);
  //   }
  // }

  // setBookmark(MovieModel item) {
  //   int index =
  //       state.listBookmark.indexWhere((element) => element.id == item.id);
  //   if (index != -1) {
  //     // Xoa khoi danh sach bookmark
  //     state.listBookmark.removeAt(index);
  //     myListController.getListBookmark();
  //   } else {
  //     // Theem vao danh sach bookmark
  //     state.listBookmark.add(item);
  //   }

  //   // Luu vao shared
  //   SharedService.to.setString(MyKey.listBookmark, state.listBookmark);
  // }

  // tab content
  setListTab() {
    state.listTab.addAll(
      [
        const MovieDetailTraillder(),
        const MovieDetailSimilar(),
        const MovieDetailReview(),
      ],
    );
  }

  setCurrentTab(index) {
    state.currentTab.value = index;
  }

  Widget getTab() {
    return state.listTab[state.currentTab.value];
  }

  // chuyen huong

  goToPlayTrailler(TraillerModel item) {
    Get.toNamed(RouterName.videoPlayYoutube, arguments: item);
  }
}
