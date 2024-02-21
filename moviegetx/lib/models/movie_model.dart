// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class MovieModel {
  bool adult;
  String? backdrop_path;
  int id;
  String title;
  String original_title;
  String overview;
  String? poster_path;
  String? media_type;
  List<int> genre_ids;
  double popularity;
  String? release_date;
  bool? video;
  double? vote_average;
  int? vote_count;
  MovieModel({
    required this.adult,
    required this.backdrop_path,
    required this.id,
    required this.title,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    this.media_type = 'movie',
    required this.genre_ids,
    required this.popularity,
    this.release_date,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdrop_path,
      'id': id,
      'title': title,
      'original_title': original_title,
      'overview': overview,
      'poster_path': poster_path,
      'media_type': media_type,
      'genre_ids': genre_ids,
      'popularity': popularity,
      'release_date': release_date,
      'video': video,
      'vote_average': vote_average,
      'vote_count': vote_count,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      adult: map['adult'] as bool,
      backdrop_path:
          map['backdrop_path'] != null ? map['backdrop_path'] as String : null,
      id: map['id'] as int,
      title: map['title'] as String,
      original_title: map['original_title'] as String,
      overview: map['overview'] as String,
      poster_path: map['poster_path'] != null
          ? map['poster_path'] as String
          : '/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
      media_type:
          map['media_type'] != null ? map['media_type'] as String : null,
      genre_ids:
          map['genre_ids'] != null ? List<int>.from((map['genre_ids'])) : [],
      popularity: map['genre_ids'] != null ? map['popularity'] as double : 0.0,
      release_date:
          map['release_date'] != null ? map['release_date'] as String : null,
      video: map['video'] != null ? map['video'] as bool : false,
      vote_average:
          map['vote_average'] != null ? map['vote_average'].toDouble() : 0.0,
      vote_count: map['vote_count'] != null ? map['vote_count'] as int : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
