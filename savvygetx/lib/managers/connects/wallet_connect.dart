import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WalletConnect extends GetConnect {
  final _mainHeaders = ({
    'content-type': 'multipart/form-data',
  });
  Future<dynamic> list() async {
    final response =
        await rootBundle.loadString('assets/mockups/wallet_type_data.json');
    return response;
  }
}
