import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/movie_detail_controller.dart';
import 'package:moviegetx/pages/movie_detail/widgets/movie_detail_cast.dart';
import 'package:moviegetx/pages/movie_detail/widgets/movie_detail_info.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_outlined,
              ),
            ),
            actions: [
              SvgPicture.asset('assets/images/icon_share.svg'),
              getWidth(context, 0.04),
            ],
            expandedHeight:
                320.0, // Set the height of the app bar when expanded
            floating:
                false, // Set to true if you want the app bar to "float" on scroll
            pinned:
                false, // Set to true if you want the app bar to stay pinned when scrolled up
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl:
                    '${MovieImage.posterPath}${controller.state.item.backdrop_path}',
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Image.asset('assets/images/404.png');
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailInfo(
                      item: controller.state.item, controller: controller),
                  Obx(
                    () {
                      return Wrap(
                        children: [
                          Text(
                            controller.state.item.overview,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines:
                                controller.state.showMore.value ? 100000 : 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          getHeight(context, 0.01),
                          InkWell(
                            onTap: controller.setShowMoreContent,
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                controller.state.showMore.value
                                    ? 'Hidden'
                                    : 'View More',
                                style: const TextStyle(
                                  color: MovieColor.primary_500,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  getHeight(context, 0.02),
                  const MovieDetailCast(),
                  Container(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Column(
                      children: [
                        Obx(() {
                          return DefaultTabController(
                            initialIndex: controller.state.currentTab.value,
                            length: 3,
                            child: Column(
                              children: [
                                TabBar(
                                  padding: EdgeInsets.zero,
                                  onTap: controller.setCurrentTab,
                                  indicatorColor: MovieColor.primary_500,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelColor: MovieColor.primary_500,
                                  unselectedLabelColor: MovieColor.grey_800,
                                  labelStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  tabs: const [
                                    Tab(text: 'Trailers'),
                                    Tab(text: 'More like this'),
                                    Tab(text: 'Reviews'),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                        Obx(() => controller.getTab()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
