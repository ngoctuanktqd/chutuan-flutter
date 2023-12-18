import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewModel {
  int id;
  String title;
  String description;
  String content;
  String thumb;
  String category_id;
  // DateTime publishDate;
  // DateTime createdAt;
  // DateTime updatedAt;
  NewModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.thumb,
    required this.category_id,
    // required this.publishDate,
    // required this.createdAt,
    // required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'content': content,
      'thumb': thumb,
      'category_id': category_id,
      // 'publishDate': publishDate.millisecondsSinceEpoch,
      // 'createdAt': createdAt.millisecondsSinceEpoch,
      // 'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory NewModel.fromMap(Map<String, dynamic> map) {
    return NewModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      content: map['content'] as String,
      thumb: map['thumb'] as String,
      category_id: map['category_id'] as String,
      // publishDate:
      //     DateTime.fromMillisecondsSinceEpoch(map['publishDate'] as int),
      // createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      // updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewModel.fromJson(String source) =>
      NewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory NewModel.fromJson2(json) => NewModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        content: json['content'],
        thumb: json['thumb'],
        category_id: json['category_id'],
      );
}
