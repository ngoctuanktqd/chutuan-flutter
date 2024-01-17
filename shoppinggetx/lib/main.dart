import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/my_app.dart';
import 'package:shoppinggetx/firebase_options.dart';
import 'package:shoppinggetx/services/shared_service.dart';
import 'package:shoppinggetx/stores/app_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync<SharedService>(() => SharedService().init());
  Get.put(AppStore());

  runApp(const MyApp());
}
