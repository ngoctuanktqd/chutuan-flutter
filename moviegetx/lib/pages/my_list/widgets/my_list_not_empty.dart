import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/widgets/movie_item.dart';
import 'package:moviegetx/managers/controllers/my_list_controller.dart';

class MyListNotEmpty extends StatelessWidget {
  const MyListNotEmpty({
    super.key,
    required this.controller,
  });

  final MyListController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Obx(() {
        return GridView.builder(
          itemCount: controller.state.listBookmark.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 186 / 248,
          ),
          itemBuilder: (context, index) {
            final item = controller.state.listBookmark[index];
            return MovieItem(item: item);
          },
        );
      }),
    );
  }
}
