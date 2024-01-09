import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/manager/controllers/product_controller.dart';

class CategoryProductPage extends StatelessWidget {
  const CategoryProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final item = Get.arguments;
    List listProduct = DataConstant.listProduct;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.name.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: const [
          Icon(Icons.filter_alt_rounded),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.more_vert_rounded),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_rounded),
                hintText: 'Search ${item.name}',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffE8EFF3),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3 / 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      productController.goToProduct();
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
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xffFF6464),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      width: 30,
                                      height: 30,
                                      child: const Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listProduct[index].name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.end,
                                    children: [
                                      Text(
                                        '\$ ${listProduct[index].price * (1 - listProduct[index].discount)}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '\$${listProduct[index].price}',
                                        style: const TextStyle(
                                          color: Color(0xffBFC9DA),
                                          fontSize: 16,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Color(0xffBFC9DA),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    const Icon(Icons.local_offer_rounded,
                                        color: Color(0xffC29C1D)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Disc. ${listProduct[index].discount * 100}%Off',
                                      style: const TextStyle(
                                        color: Color(0xffC29C1D),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              color: Color(0xff027335),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
