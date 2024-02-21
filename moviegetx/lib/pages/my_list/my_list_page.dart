import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_icon_search.dart';
import 'package:moviegetx/managers/controllers/my_list_controller.dart';
import 'package:moviegetx/pages/my_list/widgets/my_list_empty.dart';
import 'package:moviegetx/pages/my_list/widgets/my_list_not_empty.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyListController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 24,
              height: 24,
            ),
            getWidth(context, 0.03),
            Text(
              'My List',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        actions: const [
          ButtonIconSearch(),
          SizedBox(
            width: 24,
          )
        ],
      ),
      body: Obx(() {
        if (controller.state.listBookmark.isEmpty) {
          return const MyListEmpty();
        }
        return MyListNotEmpty(controller: controller);
      }),
    );
  }
}
