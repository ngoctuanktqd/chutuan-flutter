import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/functions.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_icon_custom.dart';
import 'package:moviegetx/apps/widgets/genre_custom.dart';
import 'package:moviegetx/managers/controllers/movie_detail_controller.dart';
import 'package:moviegetx/managers/controllers/my_list_controller.dart';
import 'package:moviegetx/models/movie_model.dart';

class MovieDetailInfo extends StatelessWidget {
  const MovieDetailInfo({
    super.key,
    required this.item,
    required this.controller,
  });

  final MovieModel item;
  final MovieDetailController controller;

  @override
  Widget build(BuildContext context) {
    final myListController = Get.find<MyListController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            getWidth(context, 0.03),
            InkWell(
              onTap: () {
                myListController.setBookmark(item);
              },
              child: Obx(() {
                final isBookmark = myListController.state.listBookmark
                    .indexWhere((element) => element.id == item.id);
                return SvgPicture.asset(
                  'assets/images/icon_bookmark.svg',
                  color: isBookmark != -1 ? MovieColor.primary_500 : null,
                );
              }),
            ),
            getWidth(context, 0.03),
            SvgPicture.asset('assets/images/icon_send.svg'),
          ],
        ),
        getHeight(context, 0.02),
        Row(
          children: [
            SvgPicture.asset('assets/images/icon_star.svg'),
            getWidth(context, 0.02),
            Text(
              getVoteArg(item.vote_average),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: MovieColor.primary_500,
              ),
            ),
            getWidth(context, 0.02),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 12,
              color: MovieColor.primary_500,
            ),
            getWidth(context, 0.02),
            Text(
              getRelease(item.release_date),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            getWidth(context, 0.02),
            GenreCustom(
              name: '13+',
            ),
            getWidth(context, 0.02),
            GenreCustom(
              name: 'United States',
            ),
            getWidth(context, 0.02),
            GenreCustom(
              name: 'Subtitle',
            ),
          ],
        ),
        getHeight(context, 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ButtonIconCustom(
                icon: Icons.play_circle_fill_rounded,
                name: 'Play',
              ),
            ),
            getWidth(context, 0.04),
            Expanded(
              child: ButtonIconCustom(
                icon: Icons.download_for_offline,
                name: 'Download',
                isBorder: true,
              ),
            ),
          ],
        ),
        getHeight(context, 0.02),
        Wrap(
          children: [
            const Text(
              "Genre: ",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Obx(() {
              return Text(
                getGenre(controller.state.listGenre),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              );
            }),
          ],
        ),
        getHeight(context, 0.015),
      ],
    );
  }
}
