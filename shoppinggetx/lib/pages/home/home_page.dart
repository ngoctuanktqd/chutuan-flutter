import 'package:flutter/material.dart';
import 'package:shoppinggetx/pages/home/widgets/home_carousel.dart';
import 'package:shoppinggetx/pages/home/widgets/home_category.dart';
import 'package:shoppinggetx/pages/home/widgets/home_product.dart';
import 'package:shoppinggetx/pages/home/widgets/home_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Good Morning'),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Louis A. 👋',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 45,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 10,
                          left: 30,
                          child: Text(
                            '6',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xffC29C1D),
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 5,
                                color: Colors.white,
                              ),
                            ),
                            child: const Icon(
                              Icons.notifications_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const HomeSearchPage(),
              const SizedBox(
                height: 20,
              ),
              const HomeCarouselPage(),
              const SizedBox(
                height: 20,
              ),
              const HomeCategoryPage(),
              const SizedBox(
                height: 20,
              ),
              const HomeProductPage(),
            ],
          ),
        ),
      ),
    );
  }
}
