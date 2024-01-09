import 'package:get/route_manager.dart';
import 'package:getx/apps/routers/router_name.dart';
import 'package:getx/manager/bindings/category_binding.dart';
import 'package:getx/manager/bindings/home_binding.dart';
import 'package:getx/pages/category/category_page.dart';
import 'package:getx/pages/home/home_page.dart';

class RouterCustom {
  static List<GetPage> listPage = [
    GetPage(
        name: RouterName.home,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: RouterName.category,
        page: () => CategoryPage(),
        binding: CategoryBinding()),
  ];
}
