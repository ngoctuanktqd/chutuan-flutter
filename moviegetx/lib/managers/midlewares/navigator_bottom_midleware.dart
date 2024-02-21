// ignore_for_file: implementation_imports

import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/stores/app_store.dart';

class NavigatorBottomMidleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!AppStore.to.setupAccount) {
      // neu chua setup thi dua vao trang setup
      return const RouteSettings(name: RouterName.setupAccountInterest);
    }
    return super.redirect(route);
  }
}
