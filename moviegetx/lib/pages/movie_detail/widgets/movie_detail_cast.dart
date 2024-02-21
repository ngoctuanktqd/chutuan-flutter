import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/movie_detail_controller.dart';

class MovieDetailCast extends StatelessWidget {
  const MovieDetailCast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MovieDetailController>();
    return AspectRatio(
      aspectRatio: 380 / 45,
      child: Obx(() {
        final listCast = controller.state.listCast;
        if (listCast.isEmpty) {
          return const SizedBox.shrink();
        }
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            final itemCast = listCast[index];
            return Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: CachedNetworkImage(
                    imageUrl:
                        '${MovieImage.profilePath}${itemCast.profile_path}',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                getWidth(context, 0.01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      itemCast.name,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      itemCast.known_for_department,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return getWidth(context, 0.02);
          },
        );
      }),
    );
  }
}
