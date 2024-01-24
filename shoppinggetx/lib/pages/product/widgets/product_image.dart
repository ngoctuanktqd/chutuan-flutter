import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/manager/controllers/product_controller.dart';
import 'package:shoppinggetx/model/product_model.dart';

class ProductImagePage extends GetView<ProductController> {
  ProductImagePage({
    super.key,
    required this.item,
  });
  ProductModel item;

  @override
  Widget build(BuildContext context) {
    int indexFavorit = controller.state.listFavorit
        .indexWhere((element) => element.id == item.id);
    print(indexFavorit);

    return AspectRatio(
      aspectRatio: 1 / 0.75,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/placeholder_product.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              // const Icon(Icons.favorite_rounded),
              LikeButton(
                isLiked: indexFavorit != -1 ? true : false,
                onTap: (isLiked) async {
                  controller.setFavorit(item);
                  return !isLiked;
                },
              ),
              getHeight(context, 0.02),
              const Icon(Icons.more_vert_rounded),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
