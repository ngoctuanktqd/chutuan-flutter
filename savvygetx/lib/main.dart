import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/my_app.dart';
import 'package:savvygetx/services/shared_service.dart';
import 'package:savvygetx/stores/app_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<SharedService>(() => SharedService().init());
  Get.put(AppStore());
  runApp(const MyApp());
}
