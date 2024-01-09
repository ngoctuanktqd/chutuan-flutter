import 'package:get/instance_manager.dart';
import 'package:todogetx/pages/category/category_page.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(const CategoryPage());
  }
}
