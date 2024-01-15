import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/manager/controllers/product_controller.dart';
import 'package:shoppinggetx/model/product_model.dart';

class ProductPricePage extends StatefulWidget {
  ProductPricePage({
    super.key,
    required this.item,
  });
  ProductModel item;

  @override
  State<ProductPricePage> createState() => _ProductPricePageState();
}

class _ProductPricePageState extends State<ProductPricePage> {
  int currentQtl = 0;
  ProductController controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    int index = controller.listCart
        .indexWhere((element) => element.idProduct == widget.item.id);
    // Co tron gio hang, thi cap nhat
    if (index != -1 && currentQtl == 0) {
      currentQtl = controller.listCart[index].qtl;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.item.discount != 0
                    ? '\$${widget.item.price * (1 - widget.item.discount)}'
                    : '\$${widget.item.price.toString()}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              getWidth(context, 0.02),
              Expanded(
                child: Text(
                  widget.item.discount != 0 ? '\$${widget.item.price}' : '',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: const Color(0xffBFC9DA),
                        color: const Color(0xffBFC9DA),
                      ),
                ),
              ),
              Material(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (currentQtl > 0) {
                        currentQtl--;
                      }
                    });
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Icon(
                      Icons.remove_rounded,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              getWidth(context, 0.02),
              Text(
                currentQtl.toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              getWidth(context, 0.02),
              Material(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      currentQtl++;
                    });
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TuConstColor.green_01,
                      ),
                      color: TuConstColor.green_01,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Icon(
                      Icons.add_rounded,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        getHeight(context, 0.02),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: const BoxDecoration(
            color: TuConstColor.accent_01,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(
            '20% OFF DISCOUNT',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        getHeight(context, 0.02),
        Material(
          child: InkWell(
            onTap: () {
              controller.updateToCart(currentQtl, widget.item);
            },
            child: Ink(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                  ),
                  getWidth(context, 0.02),
                  Text(
                    'UPDATE TO CART',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
