import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/apps/widgets/text_field_custom.dart';
import 'package:shoppinggetx/manager/controllers/favorit_controller.dart';
import 'package:shoppinggetx/manager/controllers/product_controller.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritController());
    final productController = Get.find<ProductController>();
    print(productController.state.listFavorit);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorit',
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
              controller: controller.state.searchController,
              prefixIcon: Icons.search_rounded,
              hintText: 'Search Favorit Product',
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
                      productController.goToProduct(
                          productController.state.listFavorit[index].id);
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/placeholder_product.webp'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          getWidth(context, 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productController
                                      .state.listFavorit[index].name,
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
                                        '\$ ${productController.state.listFavorit[index].price * (1 - productController.state.listFavorit[index].discount)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      getWidth(context, 0.01),
                                      Text(
                                        '\$${productController.state.listFavorit[index].price}',
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
                                      'Disc. ${productController.state.listFavorit[index].discount * 100}%Off',
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
                itemCount: productController.state.listFavorit.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
