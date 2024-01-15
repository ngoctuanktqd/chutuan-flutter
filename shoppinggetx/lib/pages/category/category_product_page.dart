import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/apps/widgets/text_field_custom.dart';
import 'package:shoppinggetx/manager/controllers/product_controller.dart';

class CategoryProductPage extends StatefulWidget {
  const CategoryProductPage({super.key});

  @override
  State<CategoryProductPage> createState() => _CategoryProductPageState();
}

class _CategoryProductPageState extends State<CategoryProductPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final item = Get.arguments;
    List listProduct = DataConstant.listProduct;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          const Icon(Icons.filter_alt_rounded),
          getWidth(context, 0.02),
          const Icon(Icons.more_vert_rounded),
          getWidth(context, 0.03),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            TextFieldCustom(
              controller: searchController,
              prefixIcon: Icons.search_rounded,
              hintText: 'Search ${item.name}',
            ),
            getHeight(context, 0.05),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3 / 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      productController.goToProduct(listProduct[index].id);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/placeholder_product.webp'),
                                    fit: BoxFit.cover),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Obx(
                                      () {
                                        int indexFavorit = productController
                                            .listFavorit
                                            .indexWhere((element) =>
                                                element.id ==
                                                listProduct[index].id);
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: indexFavorit == -1
                                                ? const Color(0xffFF6464)
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          width: 32,
                                          height: 36,
                                          child: LikeButton(
                                            size: 24,
                                            isLiked: indexFavorit != -1
                                                ? true
                                                : false,
                                            likeBuilder: (bool isLiked) {
                                              return Icon(
                                                Icons.favorite,
                                                color: indexFavorit == -1
                                                    ? Colors.white
                                                    : const Color(0xffFF6464),
                                              );
                                            },
                                            onTap: (isLike) async {
                                              productController.setFavorit(
                                                  listProduct[index]);
                                              return !isLike;
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          getWidth(context, 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listProduct[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                Expanded(
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.end,
                                    children: [
                                      Text(
                                        '\$ ${listProduct[index].price * (1 - listProduct[index].discount)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      getWidth(context, 0.01),
                                      Text(
                                        '\$${listProduct[index].price}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                              color: const Color(0xffBFC9DA),
                                              fontWeight: FontWeight.w400,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor:
                                                  const Color(0xffBFC9DA),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    const Icon(
                                      Icons.local_offer_rounded,
                                      color: Color(0xffC29C1D),
                                      size: 14,
                                    ),
                                    getWidth(context, 0.01),
                                    Text(
                                      'Disc. ${listProduct[index].discount * 100}%Off',
                                      style: const TextStyle(
                                        color: Color(0xffC29C1D),
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Icon(
                              Icons.shopping_cart_rounded,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: listProduct.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
