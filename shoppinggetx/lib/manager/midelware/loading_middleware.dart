import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/stores/app_store.dart';

class LoadingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (AppStore.to.firstLogined == 1) {
      return const RouteSettings(name: RouterName.login);
    }
    // TODO: implement redirect
    return super.redirect(route);
  }
}
