import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  int id;
  int idProduct;
  int qtl;
  double price;
  double discount;
  CartModel({
    required this.id,
    required this.idProduct,
    required this.qtl,
    required this.price,
    required this.discount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idProduct': idProduct,
      'qtl': qtl,
      'price': price,
      'discount': discount,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as int,
      idProduct: map['idProduct'] as int,
      qtl: map['qtl'] as int,
      price: map['price'] as double,
      discount: map['discount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
