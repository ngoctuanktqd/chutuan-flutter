import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/my_app.dart';
import 'package:shoppinggetx/services/shared_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<SharedService>(() => SharedService().init());

  runApp(const MyApp());
}
