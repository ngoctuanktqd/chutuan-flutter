import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 0.75,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/placeholder_product.webp'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    actions: const [
                      Icon(Icons.favorite_rounded),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.more_vert_rounded),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
                  const Text(
                    'FRUITS',
                    style: TextStyle(
                      color: Color(0xff28B0CE),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Organic Lemons',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Color(0xffFFA902),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            '4.6 (89 reviews)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          width: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 0,
                        ),
                        Icon(
                          Icons.local_shipping,
                          color: Color(0xff027335),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'FREE DELIVERY',
                          style: TextStyle(
                            color: Color(0xff027335),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Price',
                    style: TextStyle(
                      color: Color(0xff7D8FAB),
                    ),
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
                        const Text(
                          '\$ 5.8',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Expanded(
                          child: Text(
                            '\$8.0',
                            style: TextStyle(
                              color: Color(0xffBFC9DA),
                              fontSize: 18,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Color(0xffBFC9DA),
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: const Color(0xffE8EFF3),
                            ),
                          ),
                          child: const Icon(
                            Icons.remove_rounded,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '3',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: const Color(0xffE8EFF3),
                            ),
                            color: const Color(0xffC8EDD9),
                          ),
                          child: const Icon(
                            Icons.add_rounded,
                            color: Color(0xff027335),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: const BoxDecoration(
                      color: Color(0xffC29C1D),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Text(
                      '20% OFF DISCOUNT',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff027335),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ADD TO CART',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
