import 'package:flutter/material.dart';
import 'package:shoppinggetx/pages/home/widgets/home_carousel.dart';
import 'package:shoppinggetx/pages/home/widgets/home_category.dart';
import 'package:shoppinggetx/pages/home/widgets/home_header.dart';
import 'package:shoppinggetx/pages/home/widgets/home_product.dart';
import 'package:shoppinggetx/pages/home/widgets/home_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeaderPage(),
              SizedBox(
                height: 20,
              ),
              HomeSearchPage(),
              SizedBox(
                height: 20,
              ),
              HomeCarouselPage(),
              SizedBox(
                height: 20,
              ),
              HomeCategoryPage(),
              SizedBox(
                height: 20,
              ),
              HomeProductPage(),
            ],
          ),
        ),
      ),
    );
  }
}
