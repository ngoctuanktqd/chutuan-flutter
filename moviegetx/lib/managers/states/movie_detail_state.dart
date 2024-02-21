import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/models/movie_model.dart';

class MovieDetailState {
  late RxBool showMore;
  late List<Widget> listTab;
  late RxInt currentTab;
  late RxList listCast;
  late RxList listGenre;
  late RxList listTrailler;
  late RxList listSimilar;
  late RxList listReview;
  late RxString backgroundVideo;
  late MovieModel item;
}
