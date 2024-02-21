// ignore_for_file: implementation_imports

import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/stores/app_store.dart';

class SignInMidleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (AppStore.to.userID != '') {
      if (!AppStore.to.setupAccount) {
        // Dua vao trang setup the loai neu chua set up
        return const RouteSettings(name: RouterName.setupAccountInterest);
      }
      // Dua thang vao trang navigatobottom
      return const RouteSettings(name: RouterName.navgigatorBottom);
    }
    return super.redirect(route);
  }
}
