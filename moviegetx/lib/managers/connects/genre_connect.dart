import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';

class GenreConnect extends GetConnect {
  final _mainHeaders = ({
    'content-type': 'multipart/form-data',
    'Authorization': 'Bearer ${MovieToken.tokenThemovieDB}',
  });

  Future<dynamic> getMovies() async {
    final response = await get(
      'https://api.themoviedb.org/3/genre/movie/list?language=en',
      headers: _mainHeaders,
    );
    if (response.statusCode == 200) {
      return response.body['genres'];
    }
    return [];
  }

  Future<dynamic> getTVSeries() async {
    final response = await get(
      'https://api.themoviedb.org/3/genre/tv/list?language=en',
      headers: _mainHeaders,
    );
    if (response.statusCode == 200) {
      return response.body['genres'];
    }
    return [];
  }
}
