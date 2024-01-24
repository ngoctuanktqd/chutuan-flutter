import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/stores/app_store.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (AppStore.to.userInfoId != '') {
      return const RouteSettings(name: RouterName.navigatorBottom);
    }
    // TODO: implement redirect
    return super.redirect(route);
  }
}
