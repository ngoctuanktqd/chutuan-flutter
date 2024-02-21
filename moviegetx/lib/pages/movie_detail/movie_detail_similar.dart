import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/movie_item.dart';
import 'package:moviegetx/managers/controllers/movie_detail_controller.dart';

class MovieDetailSimilar extends StatelessWidget {
  const MovieDetailSimilar({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MovieDetailController>();
    return Column(
      children: [
        Obx(
          () {
            List listSimilar = controller.state.listSimilar;
            if (listSimilar.isEmpty) {
              return show404(context);
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listSimilar.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 186 / 248,
              ),
              itemBuilder: (context, index) {
                final item = listSimilar[index];
                return MovieItem(item: item);
              },
            );
          },
        ),
      ],
    );
  }
}
