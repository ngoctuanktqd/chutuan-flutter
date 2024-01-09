import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todogetx/apps/untils/const.dart';
import 'package:todogetx/manager/controllers/category_controller.dart';
import 'package:todogetx/manager/controllers/tasks_controller.dart';
import 'package:todogetx/pages/tasks/widgets/tasks_by_category.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});
  @override
  Widget build(BuildContext context) {
    final taskController = Get.put(TasksController());
    final categoryController = Get.put(CategoryController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 32,
                    width: double.infinity,
                    child: Obx(
                      () {
                        final listCategory =
                            categoryController.getListCategoriesShow();
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: listCategory.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                categoryController
                                    .setCurrentCategoryTask(index);
                              },
                              child: Obx(
                                () {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(32),
                                      ),
                                      color: categoryController
                                                  .currentCategoryTask.value ==
                                              index
                                          ? TuConstantColor.subColor
                                          : const Color(0xffe1eefe),
                                    ),
                                    child: Center(
                                      child: Text(
                                        listCategory[index].name,
                                        style: TextStyle(
                                          color: categoryController
                                                      .currentCategoryTask
                                                      .value ==
                                                  index
                                              ? Colors.black
                                              : Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return getWidth(context, 0.01);
                          },
                        );
                      },
                    ),
                  ),
                ),
                PopupMenuButton(
                  position: PopupMenuPosition.under,
                  icon: const Icon(Icons.more_vert_rounded),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        onTap: () {
                          taskController.goToCategories();
                        },
                        child: const Text('Manage Categories'),
                      ),
                      const PopupMenuItem(
                        child: Text('Search'),
                      ),
                      const PopupMenuItem(
                        child: Text('Sort by'),
                      ),
                      const PopupMenuItem(
                        child: Text('Print'),
                      ),
                      const PopupMenuItem(
                        child: Text('Upgrade to PRO'),
                      ),
                    ];
                  },
                ),
              ],
            ),
            getHeight(context, 0.01),
            const TasksByCategory(),
          ],
        ),
      ),
    );
  }
}
