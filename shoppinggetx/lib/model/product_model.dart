import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  int id;
  int id_cate;
  String name;
  String description;
  String image;
  double price;
  double discount;
  double review;
  int review_count;
  ProductModel({
    required this.id,
    required this.id_cate,
    required this.name,
    this.description = '',
    required this.image,
    required this.price,
    this.discount = 0,
    this.review = 0,
    this.review_count = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'id_cate': id_cate,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'discount': discount,
      'review': review,
      'review_count': review_count,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      id_cate: map['id_cate'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      discount: map['discount'] as double,
      review: map['review'] as double,
      review_count: map['review_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
