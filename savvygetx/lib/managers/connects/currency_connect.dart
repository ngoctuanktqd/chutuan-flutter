import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CurrentConnect extends GetConnect {
  final _mainHeaders = ({
    'content-type': 'multipart/form-data',
  });
  Future<dynamic> list() async {
    final response =
        await rootBundle.loadString('assets/mockups/currency_data.json');
    return response;
  }
}
