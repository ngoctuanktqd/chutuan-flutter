import 'package:flutter/material.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/pages/home/widgets/home_carousel.dart';
import 'package:shoppinggetx/pages/home/widgets/home_category.dart';
import 'package:shoppinggetx/pages/home/widgets/home_header.dart';
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
              const HomeHeaderPage(),
              getHeight(context, 0.02),
              const HomeSearchPage(),
              const SizedBox(
                height: 20,
              ),
              const HomeCarouselPage(),
              getHeight(context, 0.02),
              const HomeCategoryPage(),
              getHeight(context, 0.02),
              const HomeProductPage(),
            ],
          ),
        ),
      ),
    );
  }
}
