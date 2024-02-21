// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TraillerModel {
  String iso_639_1;
  String iso_3166_1;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  String published_at;
  String id;
  TraillerModel({
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.published_at,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso_639_1': iso_639_1,
      'iso_3166_1': iso_3166_1,
      'name': name,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'official': official,
      'published_at': published_at,
      'id': id,
    };
  }

  factory TraillerModel.fromMap(Map<String, dynamic> map) {
    return TraillerModel(
      iso_639_1: map['iso_639_1'] as String,
      iso_3166_1: map['iso_3166_1'] as String,
      name: map['name'] as String,
      key: map['key'] as String,
      site: map['site'] as String,
      size: map['size'] as int,
      type: map['type'] as String,
      official: map['official'] as bool,
      published_at: map['published_at'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TraillerModel.fromJson(String source) =>
      TraillerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

/*"iso_639_1": "en",
        "iso_3166_1": "US",
        "name": "Escape from Deserter World",
        "key": "41NUykFTZpQ",
        "site": "YouTube",
        "size": 1080,
        "type": "Behind the Scenes",
        "official": true,
        "published_at": "2024-01-27T15:00:05.000Z",
        "id": "65b730280fb17f017b34308f" */