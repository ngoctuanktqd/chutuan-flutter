import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/movie_detail_controller.dart';
import 'package:moviegetx/models/review_model.dart';

class MovieDetailReview extends StatelessWidget {
  const MovieDetailReview({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MovieDetailController>();
    return Column(
      children: [
        Obx(() {
          List listReview = controller.state.listReview;
          if (listReview.isEmpty) {
            return showLoadingData(context);
          }
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listReview.length,
            itemBuilder: (context, index) {
              ReviewModel itemReview = listReview[index];
              return SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${MovieImage.profilePath}${itemReview.avatar_path}',
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        getWidth(context, 0.04),
                        Expanded(
                          child: Text(
                            itemReview.author,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Icon(Icons.more_vert_rounded),
                      ],
                    ),
                    getHeight(context, 0.01),
                    Text(
                      itemReview.content,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return getHeight(context, 0.04);
            },
          );
        }),
      ],
    );
  }
}
