import 'dart:async';

import 'package:demnguoc/pages/models/movie_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  List<MovieModel> listMovies = [];
  final StreamController<List<MovieModel>> _movieController =
      StreamController<List<MovieModel>>();

  Stream<List<MovieModel>> get movieController => _movieController.stream;

  Future<void> callApi() async {
    final dio = Dio();
    final res = await dio.get(
      'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Nzk4NzVlZGJmY2NkMDFkYTJmY2ZiMGFmMDU5YTkzYiIsInN1YiI6IjY1NjczZWMwZDk1NDIwMDBjNDFmY2IwZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NEfZbWNtje6eBhGMORIUsn-HJ4bGJWvogvNTReLbF38',
          'Content-Type': 'application/json',
        },
      ),
    );
    List dataMovie = res.data['results'];
    List<MovieModel> listMovies =
        dataMovie.map((e) => MovieModel.fromMap(e)).toList();
    _movieController.add(listMovies);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _movieController.close();
  }
}
