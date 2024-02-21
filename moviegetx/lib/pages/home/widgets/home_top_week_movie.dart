// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/movie_item_list.dart';
import 'package:moviegetx/apps/widgets/row_title.dart';
import 'package:moviegetx/managers/controllers/home_controller.dart';

class HomeTopWeekMovie extends StatelessWidget {
  HomeTopWeekMovie({
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
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          RowTile(
            name: nameTitle,
            function: function,
          ),
          getHeight(context, 0.02),
          Obx(() {
            final listTopWeekMovie = controller.state.listTopWeekMovie;
            if (listTopWeekMovie.isEmpty) {
              return showLoadingData(context);
            }
            return AspectRatio(
              aspectRatio: 375 / 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = listTopWeekMovie[index];
                  return MovieItemList(item: item);
                },
                separatorBuilder: (context, index) {
                  return getWidth(context, 0.02);
                },
                itemCount: controller.state.listTopWeekMovie.length,
              ),
            );
          }),
        ],
      ),
    );
  }
}
