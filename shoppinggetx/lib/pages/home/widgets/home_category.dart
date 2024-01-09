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
              const Text(
                'Category',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              InkWell(
                onTap: () {
                  categoryController.goToCategory();
                },
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
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
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: listCategory[index].color,
                    ),
                    height: 80,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(listCategory[index].image),
                        Text(
                          listCategory[index].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
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
