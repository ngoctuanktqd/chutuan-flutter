import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todogetx/apps/untils/const.dart';
import 'package:todogetx/manager/controllers/category_controller.dart';
import 'package:todogetx/model/category_model.dart';
import 'package:todogetx/pages/category/widgets/category_dialog_create.dart';
import 'package:todogetx/pages/category/widgets/category_dialog_edit.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController inputCategory = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Category'),
        actions: const [],
      ),
      body: Column(
        children: [
          Container(
            height: 32,
            width: double.infinity,
            color: TuConstantColor.subColor,
            child: Center(
              child: Text(
                'Categories display on homepage',
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
          ),
          getHeight(context, 0.03),
          Expanded(
            child: Obx(
              () {
                List<CategoryModel> listCategory =
                    categoryController.getListCategories();
                return ReorderableListView(
                  onReorder: (int oldIndex, int newIndex) {
                    categoryController.reOrderCategory(oldIndex, newIndex);
                  },
                  children: <Widget>[
                    for (int index = 0; index < listCategory.length; index += 1)
                      Container(
                        key: Key(listCategory[index].id),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 32,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: categoryController
                                    .listColor[listCategory[index].idColor],
                                shape: BoxShape.circle,
                              ),
                            ),
                            getWidth(context, 0.05),
                            Expanded(
                              child: Text(
                                listCategory[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              listCategory[index].hidden
                                  ? Icons.visibility_off_rounded
                                  : null,
                              color: Colors.grey.shade600,
                            ),
                            getWidth(context, 0.03),
                            Text(listCategory[index].countTask.toString()),
                            getWidth(context, 0.03),
                            PopupMenuButton(
                              padding: EdgeInsets.zero,
                              position: PopupMenuPosition.under,
                              icon: const Icon(Icons.more_vert_rounded),
                              itemBuilder: (context) {
                                return <PopupMenuItem>[
                                  PopupMenuItem(
                                    onTap: () {
                                      categoryDialogEdit(
                                        context,
                                        listCategory[index],
                                      );
                                    },
                                    child: const Text('Edit'),
                                  ),
                                  PopupMenuItem(
                                    onTap: () {
                                      categoryController.hiddenCategory(
                                          listCategory[index].id);
                                    },
                                    child: Obx(
                                      () => Text(
                                        listCategory[index].hidden
                                            ? 'Show'
                                            : 'Hidden',
                                      ),
                                    ),
                                  ),
                                  const PopupMenuItem(child: Text('Delete')),
                                ];
                              },
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          getHeight(context, 0.03),
          const CategoryDialogCreate(),
          getHeight(context, 0.05),
        ],
      ),
    );
  }
}
