import 'package:dio/dio.dart';
import 'package:tintuc/models/new_model.dart';

class NewRepo {
  static Future<List<NewModel>> callApiGetNewByCategoryId(id, number) async {
    final dio = Dio();

    final response = await dio.get(
        'https://apiforlearning.zendvn.com/api/categories_news/$id/articles?offset=0&limit=$number&sort_by=id&sort_dir=desc');
    List data = response.data;
    // print(data);
    List<NewModel> listData = List<NewModel>.from(
        data.map((item) => NewModel.fromJson2(item)).toList());
    return listData;
  }

  static Future<List<NewModel>> callApiGetNewByKey(key) async {
    final dio = Dio();

    final response = await dio.get(
        'https://apiforlearning.zendvn.com/api/articles/search?q=$key&offset=0&limit=10&sort_by=id&sort_dir=desc');
    List data = response.data;
    List<NewModel> listData = List<NewModel>.from(
        data.map((item) => NewModel.fromJson2(item)).toList());
    return listData;
  }
}
