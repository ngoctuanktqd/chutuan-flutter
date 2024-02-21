import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/functions.dart';
import 'package:moviegetx/managers/controllers/movie_item_controller.dart';
import 'package:moviegetx/models/movie_model.dart';

class MovieItemList extends StatelessWidget {
  const MovieItemList({
    super.key,
    required this.item,
  });

  final MovieModel item;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MovieItemController());
    return InkWell(
      onTap: () {
        controller.goToMovieDetail(item);
      },
      child: AspectRatio(
        aspectRatio: 150 / 200,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(0.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                child: CachedNetworkImage(
                  imageUrl: '${MovieImage.posterPath}${item.poster_path}',
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Image.asset('assets/images/404.png');
                  },
                ),
              ),
            ),
            Positioned(
              top: 12.0,
              left: 12.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: MovieColor.primary_500,
                ),
                child: Text(
                  getVoteArg(item.vote_average),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
