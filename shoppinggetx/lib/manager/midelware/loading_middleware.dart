import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/stores/app_store.dart';

class LoadingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print(AppStore.to.firstLogined);
    // TODO: implement redirect
    return super.redirect(route);
  }
}
