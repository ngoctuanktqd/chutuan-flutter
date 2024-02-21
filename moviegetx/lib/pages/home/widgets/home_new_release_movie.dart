// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/movie_item_list.dart';
import 'package:moviegetx/apps/widgets/row_title.dart';
import 'package:moviegetx/managers/controllers/home_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeNewReleaseMovie extends StatelessWidget {
  HomeNewReleaseMovie({
    super.key,
    required this.controller,
    required this.nameTitle,
    this.function,
  });

  final HomeController controller;
  String nameTitle;
  Function()? function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
      child: Column(
        children: [
          RowTile(
            name: nameTitle,
            function: function,
          ),
          getHeight(context, 0.02),
          AspectRatio(
            aspectRatio: 375 / 200,
            child: Obx(
              () {
                final listNewReleaseMovie =
                    controller.state.listNewReleaseMovie;
                if (listNewReleaseMovie.isEmpty) {
                  return showLoadingData(context);
                }
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = listNewReleaseMovie[index];
                    return MovieItemList(item: item);
                  },
                  separatorBuilder: (context, index) {
                    return getWidth(context, 0.02);
                  },
                  itemCount: controller.state.listNewReleaseMovie.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
