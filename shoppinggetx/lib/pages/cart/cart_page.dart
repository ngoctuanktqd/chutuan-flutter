import 'package:flutter/material.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/apps/widgets/button_custom.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: [
          const Icon(Icons.more_vert_rounded),
          getWidth(context, 0.03),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 3 / 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        getWidth(context, 0.03),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Product Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                'Cate Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$10',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  getWidth(context, 0.02),
                                  Expanded(
                                    child: Text(
                                      '\$10',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 18,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                const Color(0xffBFC9DA),
                                            color: const Color(0xffBFC9DA),
                                          ),
                                    ),
                                  ),
                                  Material(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Ink(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        child: Icon(
                                          Icons.remove_rounded,
                                          size: 24,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  getWidth(context, 0.02),
                                  Text(
                                    10.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  getWidth(context, 0.02),
                                  Material(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Ink(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: TuConstColor.green_01,
                                          ),
                                          color: TuConstColor.green_01,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        child: Icon(
                                          Icons.add_rounded,
                                          size: 24,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 3,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(),
                  )
                ],
              ),
              AspectRatio(
                aspectRatio: 1.5 / 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            '\$54.76',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TAX (2%)',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            '\$54.76',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                          ),
                          Text(
                            '\$54.76',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: TuConstColor.green_01,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getWidth(context, 0.02),
                            Text(
                              'Apply Promotion Code',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            getWidth(context, 0.02),
                            Text(
                              '2 Promos',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            getWidth(context, 0.02),
                          ],
                        ),
                      ),
                      ButtonCustom(
                        title: 'CHECK OUT',
                        function: () {},
                      ),
                      getHeight(context, 0.02),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
