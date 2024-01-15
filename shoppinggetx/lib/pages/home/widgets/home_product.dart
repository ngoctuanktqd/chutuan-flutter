import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/manager/controllers/product_controller.dart';

class HomeProductPage extends StatelessWidget {
  const HomeProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    List listProduct = DataConstant.listProduct;
    final productController = Get.put(ProductController());
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
          child: Text(
            'Popular Deals',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 18,
                ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          width: double.infinity,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 150 / 261,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: TuConstColor.color_01,
                  ),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        productController.goToProduct(listProduct[index].id);
                      },
                      child: AspectRatio(
                        aspectRatio: 150 / 140,
                        child: Stack(
                          fit: StackFit.loose,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/placeholder_product.webp',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              right: -30,
                              child: RotationTransition(
                                turns: const AlwaysStoppedAnimation(45 / 360),
                                child: Container(
                                  width: 120,
                                  height: 24,
                                  color: TuConstColor.red_01,
                                  child: const Center(
                                    child: Text(
                                      '5% OFF',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Obx(() {
                                int indexFavorit = productController.listFavorit
                                    .indexWhere((element) =>
                                        element.id == listProduct[index].id);
                                return LikeButton(
                                  isLiked: indexFavorit != -1 ? true : false,
                                  onTap: (isLike) async {
                                    productController
                                        .setFavorit(listProduct[index]);
                                    return null;
                                    // return !isLike;
                                  },
                                );
                              }),
                              // ,
                            ),
                          ],
                        ),
                      ),
                    ),
                    getHeight(context, 0.01),
                    InkWell(
                      onTap: () {
                        productController.goToProduct(listProduct[index].id);
                      },
                      child: Text(
                        listProduct[index].name,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '\$ ${listProduct[index].price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: TuConstColor.accent_01,
                                  ),
                            ),
                          ),
                          Text(
                            '(${listProduct[index].review_count.toString()})',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 10,
                                ),
                          ),
                          const Icon(
                            Icons.star,
                            color: TuConstColor.yellow_01,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () {
                          final inCart = productController.listCart.indexWhere(
                              (e) => e.idProduct == listProduct[index].id);
                          if (inCart == -1) {
                            return InkWell(
                              onTap: () {
                                productController.addToCart(listProduct[index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: TuConstColor.green_01,
                                  ),
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      'Add to cart',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      productController.removeCart(
                                          listProduct[index], false);
                                    },
                                    child: Ink(
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Icon(
                                        Icons.remove_rounded,
                                        size: 24,
                                        color: Colors.white,
                                        weight: 600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${productController.listCart[inCart].qtl}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      productController
                                          .addToCart(listProduct[index]);
                                    },
                                    child: Ink(
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      child: const Icon(
                                        Icons.add_rounded,
                                        size: 24,
                                        color: Colors.white,
                                        weight: 600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
