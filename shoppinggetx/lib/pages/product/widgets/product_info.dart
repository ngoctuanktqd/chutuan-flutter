import 'package:flutter/material.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/model/product_model.dart';

class ProductInfoPage extends StatelessWidget {
  ProductInfoPage({
    super.key,
    required this.item,
  });
  ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FRUITS',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: const Color(0xFF28B0CE),
              ),
        ),
        getHeight(context, 0.01),
        Text(
          item.name,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
        getHeight(context, 0.01),
        Text(
          item.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        getHeight(context, 0.02),
        Row(
          children: [
            const Icon(
              Icons.star_rounded,
              color: TuConstColor.yellow_01,
            ),
            getWidth(context, 0.01),
            Expanded(
              child: Text(
                '${item.review_count} (${item.review_count} reviews)',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Icon(
              Icons.local_shipping,
              color: Theme.of(context).colorScheme.secondary,
            ),
            getWidth(context, 0.01),
            Text(
              'FREE DELIVERY',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
