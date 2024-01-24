import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/model/product_model.dart';

class ProductState {
  RxList<ProductModel> listFavorit = <ProductModel>[].obs;
  late TextEditingController searchController;
}
