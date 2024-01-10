import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todogetx/apps/untils/const.dart';
import 'package:todogetx/manager/controllers/category_controller.dart';

class CategoryDialogCreate extends StatefulWidget {
  const CategoryDialogCreate({
    super.key,
  });

  @override
  State<CategoryDialogCreate> createState() => _CategoryDialogCreateState();
}

class _CategoryDialogCreateState extends State<CategoryDialogCreate> {
  TextEditingController inputCategory = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 32,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              List<Color> listColor = categoryController.listColor;
              return AlertDialog(
                backgroundColor: Colors.white,
                title: const Text(
                  'Create New Category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      width: double.infinity,
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          controller: inputCategory,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (categoryController.listCategories.indexWhere(
                                    (element) => element.name == value) !=
                                -1) {
                              return 'This name have existed!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade300,
                            filled: true,
                            hintText: 'Type your category!',
                          ),
                          minLines: 3,
                          maxLines: 3,
                          maxLength: 50,
                        ),
                      ),
                    ),
                    getHeight(context, 0.01),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Text(
                            'Category Color',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Text(
                          'Default',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        getWidth(context, 0.01),
                        Obx(
                          () {
                            return Container(
                              width: 12,
                              height: 13,
                              decoration: BoxDecoration(
                                color: listColor[
                                    categoryController.indexColor.value],
                                shape: BoxShape.circle,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const Text(
                      'The color will be display in the calender interface',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    getHeight(context, 0.01),
                    SizedBox(
                      height: 32,
                      width: MediaQuery.sizeOf(context).width,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              categoryController.setIndexColor(index);
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: listColor[index],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Obx(
                                  () {
                                    return Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: listColor[index],
                                        shape: BoxShape.circle,
                                        border: index ==
                                                categoryController
                                                    .indexColor.value
                                            ? Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              )
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return getWidth(context, 0.01);
                        },
                        itemCount: listColor.length,
                      ),
                    ),
                  ],
                ),
                actions: [
                  InkWell(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: TuConstantColor.cancel,
                      ),
                    ),
                    onTap: () {
                      categoryController.setIndexColor(4);
                      Get.back();
                    },
                  ),
                  getWidth(context, 0.02),
                  InkWell(
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: TuConstantColor.subColor,
                      ),
                    ),
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        categoryController.createCategory(inputCategory.text);
                        inputCategory.clear();
                        Get.back();
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Row(
          children: [
            const Icon(
              Icons.add_rounded,
              color: TuConstantColor.subColor,
            ),
            getWidth(context, 0.03),
            const Text(
              'Create New Category',
              style: TextStyle(
                color: TuConstantColor.subColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
