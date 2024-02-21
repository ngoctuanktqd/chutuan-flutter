// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/functions.dart';
import 'package:moviegetx/managers/controllers/movie_item_controller.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.item,
  });

  final item;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MovieItemController());
    return InkWell(
      onTap: () {
        controller.goToMovieDetail(item);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                imageUrl: '${MovieImage.posterPath}${item.poster_path}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                color: MovieColor.primary_500,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                getVoteArg(item.vote_average),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
