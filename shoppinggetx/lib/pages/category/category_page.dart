import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/manager/controllers/category_product_controller.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProductController = Get.put(CategoryProductController());

    List listCategory = DataConstant.listCategory;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
              ),
        ),
        actions: const [
          Icon(Icons.more_vert_rounded),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: GridView.builder(
            itemCount: listCategory.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 1 / 1,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  categoryProductController
                      .goToCategoryProduct(listCategory[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: listCategory[index].color,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        listCategory[index].image,
                        width: 36,
                        height: 36,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        listCategory[index].name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
