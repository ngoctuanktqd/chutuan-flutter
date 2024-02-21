import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/movie_detail_controller.dart';
import 'package:moviegetx/models/trailler_model.dart';

class MovieDetailTraillder extends StatelessWidget {
  const MovieDetailTraillder({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MovieDetailController>();
    return Obx(() {
      final listTrailler = controller.state.listTrailler;
      return ListView.separated(
        padding: const EdgeInsets.only(top: 24.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listTrailler.length,
        itemBuilder: (context, index) {
          TraillerModel itemTrailler = listTrailler[index];
          return InkWell(
            onTap: () {
              controller.goToPlayTrailler(itemTrailler);
            },
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          '${MovieImage.posterPath}${controller.state.backgroundVideo.value}',
                      width: 150.0,
                      height: 112.5,
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      child: Icon(
                        Icons.play_circle_outline_rounded,
                      ),
                    ),
                  ],
                ),
                getWidth(context, 0.04),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemTrailler.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      getHeight(context, 0.02),
                      Text(
                        itemTrailler.site,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      getHeight(context, 0.02),
                      Text(
                        itemTrailler.type,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: MovieColor.primary_500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return getHeight(context, 0.02);
        },
      );
    });
  }
}
