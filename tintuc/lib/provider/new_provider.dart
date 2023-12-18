import 'package:flutter/material.dart';
import 'package:tintuc/models/new_model.dart';
import 'package:tintuc/repository/new_repo.dart';

class NewProvider extends ChangeNotifier {
  List<NewModel> listNewByCategoryId = [];

  Future<List<NewModel>> getNewByCategoryId(id, number) async {
    try {
      List<NewModel> data = await NewRepo.callApiGetNewByCategoryId(id, number);
      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
