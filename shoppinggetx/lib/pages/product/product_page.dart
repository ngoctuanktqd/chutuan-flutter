import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/manager/controllers/product_controller.dart';
import 'package:shoppinggetx/model/product_model.dart';
import 'package:shoppinggetx/pages/product/widgets/product_image.dart';
import 'package:shoppinggetx/pages/product/widgets/product_info.dart';
import 'package:shoppinggetx/pages/product/widgets/product_price.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    ProductModel product = controller.getProductById(data);
    print(product);
    return Scaffold(
      body: Column(
        children: [
          ProductImagePage(item: product),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductInfoPage(item: product),
                  getHeight(context, 0.02),
                  ProductPricePage(item: product),
                  getHeight(context, 0.02),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
