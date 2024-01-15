import 'package:flutter/material.dart';
import 'package:shoppinggetx/model/category_model.dart';
import 'package:shoppinggetx/model/product_model.dart';

class TuConstColor {
  static const Color color_01 = Color(0xffE8EFF3);
  static const Color color_03 = Colors.white;
  static const Color red_01 = Color(0xffFF4040);
  static const Color red_02 = Color(0xffFF6464);
  static const Color yellow_01 = Color(0xffFFA902);
  static const Color accent_01 = Color(0xffC29C1D);
  static const Color green_01 = Color(0xffC8EDD9);
}

class DataConstant {
  static List<ProductModel> listProduct = [
    ProductModel(
      id: 1,
      id_cate: 1,
      name: 'Product 1',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 2,
      id_cate: 1,
      name: 'Product 2',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 3,
      id_cate: 1,
      name: 'Product 3',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 4,
      id_cate: 1,
      name: 'Product 4',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 5,
      id_cate: 1,
      name: 'Product 5',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 6,
      id_cate: 1,
      name: 'Product 6',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 7,
      id_cate: 1,
      name: 'Product 7',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 8,
      id_cate: 1,
      name: 'Product 8',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 9,
      id_cate: 1,
      name: 'Product 9',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 10,
      id_cate: 1,
      name: 'Product 10',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 11,
      id_cate: 1,
      name: 'Product 11',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 12,
      id_cate: 1,
      name: 'Product 12',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
    ProductModel(
      id: 13,
      id_cate: 1,
      name: 'Product 13',
      description: 'description',
      image: 'assets/images/placeholder_product.webp',
      price: 10.0,
      discount: 0.2,
      review: 4.5,
      review_count: 50,
    ),
  ];

  static List<CategoryModel> listCategory = [
    CategoryModel(
      id: 1,
      name: 'Fruits',
      image: 'assets/images/ic_Fruit.svg',
      color: const Color(0xff28b0ce),
    ),
    CategoryModel(
      id: 2,
      name: 'Fish',
      image: 'assets/images/ic_Fish.svg',
      color: const Color(0xff14ab87),
    ),
    CategoryModel(
      id: 3,
      name: 'Chicken',
      image: 'assets/images/ic_Chicken.svg',
      color: const Color(0xffa131ad),
    ),
    CategoryModel(
      id: 4,
      name: 'Pizza',
      image: 'assets/images/ic_Fruit.svg',
      color: const Color(0xffae7156),
    ),
    CategoryModel(
      id: 5,
      name: 'Vegetables',
      image: 'assets/images/ic_Fruit.svg',
      color: const Color(0xff28b0ce),
    ),
    CategoryModel(
      id: 6,
      name: 'Bakery',
      image: 'assets/images/ic_Fruit.svg',
      color: const Color(0xff14ab87),
    ),
    CategoryModel(
      id: 7,
      name: 'Mushroom',
      image: 'assets/images/ic_Fruit.svg',
      color: const Color(0xff14ab87),
    ),
    CategoryModel(
      id: 8,
      name: 'Dairy',
      image: 'assets/images/ic_Fruit.svg',
      color: const Color(0xff14ab87),
    ),
  ];
}
