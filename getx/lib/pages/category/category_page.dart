import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx/manager/controllers/category_controller.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
    );
  }
}
