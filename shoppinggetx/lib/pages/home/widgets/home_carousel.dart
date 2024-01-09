import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarouselPage extends StatelessWidget {
  const HomeCarouselPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 1,
      child: CarouselSlider.builder(
        itemCount: 2,
        itemBuilder: (context, index, realInd) {
          return Image.asset('assets/images/placeholder_slide.png');
        },
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
      ),
    );
  }
}
