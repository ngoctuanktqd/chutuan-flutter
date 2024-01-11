import 'package:get/route_manager.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/manager/bindings/category_binding.dart';
import 'package:shoppinggetx/manager/bindings/category_product_binding.dart';
import 'package:shoppinggetx/manager/bindings/home_binding.dart';
import 'package:shoppinggetx/manager/bindings/loading_binding.dart';
import 'package:shoppinggetx/manager/bindings/login_binding.dart';
import 'package:shoppinggetx/manager/bindings/navigator_bottom_binding.dart';
import 'package:shoppinggetx/manager/bindings/product_binding.dart';
import 'package:shoppinggetx/manager/bindings/settings_binding.dart';
import 'package:shoppinggetx/manager/bindings/signup_binding.dart';
import 'package:shoppinggetx/pages/category/category_page.dart';
import 'package:shoppinggetx/pages/category/category_product_page.dart';
import 'package:shoppinggetx/pages/home/home_page.dart';
import 'package:shoppinggetx/pages/loading/loading_page.dart';
import 'package:shoppinggetx/pages/login/login_page.dart';
import 'package:shoppinggetx/pages/navigatorbottom/navigator_bottom_page.dart';
import 'package:shoppinggetx/pages/product/product_page.dart';
import 'package:shoppinggetx/pages/settings/settings_page.dart';
import 'package:shoppinggetx/pages/signup/signup_page.dart';

class RouterCustom {
  static List<GetPage> listPage = [
    GetPage(
      name: RouterName.loading,
      page: () => const LoadingPage(),
      binding: LoadingBinding(),
    ),
    GetPage(
      name: RouterName.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouterName.signup,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: RouterName.navigatorBottom,
      page: () => const NavigatorBottomPage(),
      binding: NavigatorBottomBinding(),
    ),
    GetPage(
      name: RouterName.settings,
      binding: SettingsBinding(),
      page: () => const SettingsPage(),
    ),
    GetPage(
      name: RouterName.home,
      binding: HomeBinding(),
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouterName.product,
      binding: ProductBinding(),
      page: () => const ProductPage(),
    ),
    GetPage(
      name: RouterName.category,
      page: () => const CategoryPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: RouterName.categoryProduct,
      page: () => const CategoryProductPage(),
      binding: CategoryProductBinding(),
    ),
  ];
}
