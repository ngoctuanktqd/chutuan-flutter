// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReviewModel {
  String id;
  String author;
  String? avatar_path;
  double? rating;
  String content;
  String created_at;
  String updated_at;
  ReviewModel({
    required this.id,
    required this.author,
    required this.avatar_path,
    required this.rating,
    required this.content,
    required this.created_at,
    required this.updated_at,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'author': author,
      'avatar_path': avatar_path,
      'rating': rating,
      'content': content,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      id: map['id'] as String,
      author: map['author'] as String,
      avatar_path: map['author_details']['avatar_path'] != null
          ? map['author_details']['avatar_path'] as String
          : '/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
      rating: map['author_details']['rating'] != null
          ? map['author_details']['rating'] as double
          : 0.0,
      content: map['content'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
