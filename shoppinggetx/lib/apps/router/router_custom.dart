import 'package:get/route_manager.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/manager/bindings/cart_binding.dart';
import 'package:shoppinggetx/manager/bindings/category_binding.dart';
import 'package:shoppinggetx/manager/bindings/category_product_binding.dart';
import 'package:shoppinggetx/manager/bindings/checkout_binding.dart';
import 'package:shoppinggetx/manager/bindings/favorit_binding.dart';
import 'package:shoppinggetx/manager/bindings/home_binding.dart';
import 'package:shoppinggetx/manager/bindings/loading_binding.dart';
import 'package:shoppinggetx/manager/bindings/login_binding.dart';
import 'package:shoppinggetx/manager/bindings/navigator_bottom_binding.dart';
import 'package:shoppinggetx/manager/bindings/person_info_binding.dart';
import 'package:shoppinggetx/manager/bindings/product_binding.dart';
import 'package:shoppinggetx/manager/bindings/settings_binding.dart';
import 'package:shoppinggetx/manager/bindings/signup_binding.dart';
import 'package:shoppinggetx/manager/midelware/loading_middleware.dart';
import 'package:shoppinggetx/manager/midelware/login_middleware.dart';
import 'package:shoppinggetx/pages/cart/cart_page.dart';
import 'package:shoppinggetx/pages/category/category_page.dart';
import 'package:shoppinggetx/pages/category/category_product_page.dart';
import 'package:shoppinggetx/pages/checkout/checkout_page.dart';
import 'package:shoppinggetx/pages/favorit/favorit_page.dart';
import 'package:shoppinggetx/pages/home/home_page.dart';
import 'package:shoppinggetx/pages/loading/loading_page.dart';
import 'package:shoppinggetx/pages/login/login_page.dart';
import 'package:shoppinggetx/pages/navigatorbottom/navigator_bottom_page.dart';
import 'package:shoppinggetx/pages/product/product_page.dart';
import 'package:shoppinggetx/pages/settings/settings_page.dart';
import 'package:shoppinggetx/pages/signup/signup_page.dart';
import 'package:shoppinggetx/pages/user/person_info_page.dart';

class RouterCustom {
  static List<GetPage> listPage = [
    GetPage(
      name: RouterName.loading,
      page: () => const LoadingPage(),
      binding: LoadingBinding(),
      middlewares: [
        LoadingMiddleware(),
        // LoginMiddleware(),
      ],
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
    GetPage(
      name: RouterName.cart,
      page: () => const CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RouterName.checkout,
      page: () => const CheckoutPage(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: RouterName.favorit,
      page: () => const FavoritPage(),
      binding: FavoritBinding(),
    ),
    GetPage(
      name: RouterName.personInfo,
      page: () => const PersonInfoPage(),
      binding: PersonInfoBinding(),
    ),
  ];
}
