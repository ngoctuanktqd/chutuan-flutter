import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';

class MovieConnect extends GetConnect {
  final _mainHeaders = ({
    'content-type': 'multipart/form-data',
    'Authorization': 'Bearer ${MovieToken.tokenThemovieDB}',
  });

  Future<dynamic> getTopWeekMovie() async {
    final response = await get(
      'https://api.themoviedb.org/3/trending/movie/week?language=en-US',
      headers: _mainHeaders,
    );
    if (response.statusCode == 200) {
      return response.body['results'];
    }
    return [];
  }

  Future<dynamic> getReleaseMovie(int page) async {
    final response = await get(
      'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=$page',
      headers: _mainHeaders,
    );
    if (response.statusCode == 200) {
      return response.body['results'];
    }
    return [];
  }

  Future<dynamic> getNowPlaying(int page) async {
    final response = await get(
      'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=$page',
      headers: _mainHeaders,
    );
    if (response.statusCode == 200) {
      return response.body['results'];
    }
    return [];
  }

  Future<dynamic> getExplore(int page) async {
    final response = await get(
      'https://api.themoviedb.org/3/discover/movie?language=en-US&page=$page&sort_by=popularity.desc',
      headers: _mainHeaders,
    );
    if (response.statusCode == 200) {
      return response.body['results'];
    }
    return [];
  }

  Future<dynamic> getSearch(int page, String key) async {
    final response = await get(
      'https://api.themoviedb.org/3/search/movie?query=$key&include_adult=false&language=en-US&page=$page',
      headers: _mainHeaders,
    );
    if (response.statusCode == 200) {
      return response.body['results'];
    }
    return [];
  }

  Future<dynamic> getDetail(int id) async {
    final response = await get(
      'https://api.themoviedb.org/3/movie/$id?append_to_response=credits%2Cvideos%2Ctranslations%2Csimilar%2Creviews&language=en-US',
      headers: _mainHeaders,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    return [];
  }

  Future<dynamic> getTopRated(int page) async {
    final response = await get(
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=$page',
      headers: _mainHeaders,
    );
    if (response.statusCode == 200) {
      return response.body['results'];
    }
    return [];
  }

  // Future<dynamic> getMovies() async {
  //   final response = await get(
  //     'https://api.themoviedb.org/3/genre/movie/list?language=en',
  //     headers: _mainHeaders,
  //   );
  //   if (response.statusCode == 200) {
  //     return response.body['genres'];
  //   }
  //   return [];
  // }

  // Future<dynamic> getTVSeries() async {
  //   final response = await get(
  //     'https://api.themoviedb.org/3/genre/tv/list?language=en',
  //     headers: _mainHeaders,
  //   );
  //   if (response.statusCode == 200) {
  //     return response.body['genres'];
  //   }
  //   return [];
  // }
}
