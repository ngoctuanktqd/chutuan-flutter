// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_icon_custom.dart';
import 'package:moviegetx/apps/widgets/button_icon_search.dart';
import 'package:moviegetx/managers/controllers/home_controller.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({
    super.key,
    required this.controller,
  });

  HomeController controller;

  @override
  Widget build(BuildContext context) {
    // final myListController = Get.put(MyListController());
    return SliverAppBar(
      expandedHeight: 400.0,
      pinned: false,
      floating: false,
      excludeHeaderSemantics: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24.0, left: 24.0),
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      controller.state.movieTopRated.value.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      controller.state.movieTopRated.value.overview,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        ButtonIconCustom(
                          function: controller.goToMovieRated,
                        ),
                        getWidth(context, 0.02),
                        ButtonIconCustom(
                          icon: Icons.add,
                          name: 'My List',
                          isBorder: true,
                        ),
                      ],
                    )
                  ],
                );
              }),
            );
          },
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: false,
        titlePadding: const EdgeInsets.only(bottom: 24.0, left: 24.0),
        expandedTitleScale: 1,
        background: AspectRatio(
          aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
          child: CachedNetworkImage(
            imageUrl:
                'https://image.tmdb.org/t/p/w1066_and_h600_bestv2/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg',
            fit: BoxFit.cover,
            color: MovieColor.grey_500, // Set your desired color
            colorBlendMode: BlendMode.modulate,
          ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Image.asset(
          'assets/images/logo.png',
          height: 32,
          width: 32,
        ),
      ),
      actions: [
        const ButtonIconSearch(),
        getWidth(context, 0.02),
        const Icon(
          Icons.notifications_outlined,
          color: Colors.white,
          size: 32,
        ),
        const SizedBox(
          width: 24,
        ),
      ],
    );
  }
}
