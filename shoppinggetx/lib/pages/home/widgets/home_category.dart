import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/manager/controllers/category_controller.dart';
import 'package:shoppinggetx/manager/controllers/category_product_controller.dart';

class HomeCategoryPage extends StatelessWidget {
  const HomeCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List listCategory = DataConstant.listCategory;

    final categoryController = Get.put(CategoryController());
    final categoryProductController = Get.put(CategoryProductController());
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              InkWell(
                onTap: () {
                  categoryController.goToCategory();
                },
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: AspectRatio(
            aspectRatio: 4 / 0.8,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    categoryProductController
                        .goToCategoryProduct(listCategory[index]);
                  },
                  child: Ink(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: listCategory[index].color,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(listCategory[index].image),
                        Text(
                          listCategory[index].name,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
              itemCount: listCategory.length,
            ),
          ),
        ),
      ],
    );
  }
}
