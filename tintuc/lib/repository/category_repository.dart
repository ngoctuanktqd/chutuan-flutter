import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:tintuc/models/category_model.dart';

class CategoryRepo {
  static Future<List<CategoryModel>> callApiGetAllCategory() async {
    final dio = Dio();
    final response = await dio.get(
        'https://apiforlearning.zendvn.com/api/categories_news?offset=0&limit=10&sort_by=id&sort_dir=asc');
    List data = response.data;
    List<CategoryModel> listData = List<CategoryModel>.from(
        data.map((item) => CategoryModel.fromMap(item)).toList());
    // data.map((item) => CategoryModel.fromJson(jsonEncode(item))).toList();
    return listData;
  }

  static Future<CategoryModel> callApiGetInfoCategory(int id) async {
    final dio = Dio();
    final response = await dio
        .get('https://apiforlearning.zendvn.com/api/categories_news/$id');
    CategoryModel data = CategoryModel.fromJson2(response.data);
    return data;
  }
}
