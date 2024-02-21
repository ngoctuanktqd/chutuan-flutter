import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/my_app.dart';
import 'package:moviegetx/firebase_options.dart';
import 'package:moviegetx/services/shared_service.dart';
import 'package:moviegetx/stores/app_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync<SharedService>(() => SharedService().init());
  Get.put(AppStore());
  runApp(const MyApp());
}
