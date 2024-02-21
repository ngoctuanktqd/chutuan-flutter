// ignore_for_file: implementation_imports

import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/stores/app_store.dart';

class WellcomeMidleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    //
    // Da vao lan dau thi khoi qua trang wellcome
    if (!AppStore.to.firstLogin) {
      return const RouteSettings(name: RouterName.signIn);
    }
    return super.redirect(route);
  }
}
