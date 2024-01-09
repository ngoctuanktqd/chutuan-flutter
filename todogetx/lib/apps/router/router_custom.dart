import 'package:get/route_manager.dart';
import 'package:todogetx/apps/router/router_name.dart';
import 'package:todogetx/manager/bindings/boarding_binding.dart';
import 'package:todogetx/manager/bindings/category_binding.dart';
import 'package:todogetx/manager/bindings/navigator_bottom_binding.dart';
import 'package:todogetx/manager/bindings/tasks_binding.dart';
import 'package:todogetx/pages/boarding/boarding_page.dart';
import 'package:todogetx/pages/category/category_page.dart';
import 'package:todogetx/pages/navigatorBottom/navigator_bottom_page.dart';
import 'package:todogetx/pages/tasks/tasks_page.dart';

class RouterCustom {
  static List<GetPage> getPages = [
    GetPage(
      name: RouterName.boarding,
      page: () => const BoardingPage(),
      binding: BoardingBinding(),
    ),
    GetPage(
      name: RouterName.navigatorBottom,
      page: () => const NavigatorBottomPage(),
      binding: NavigatorBottomBinding(),
    ),
    GetPage(
      name: RouterName.tasks,
      page: () => const TasksPage(),
      binding: TasksBinding(),
    ),
    GetPage(
      name: RouterName.categories,
      page: () => const CategoryPage(),
      binding: CategoryBinding(),
    ),
  ];
}
