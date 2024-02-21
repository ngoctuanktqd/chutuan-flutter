import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_icon_search.dart';
import 'package:moviegetx/apps/widgets/movie_item.dart';
import 'package:moviegetx/managers/controllers/movie_top_controller.dart';

class MovieTopPage extends GetView<MovieTopController> {
  const MovieTopPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies Top',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          const ButtonIconSearch(),
          getWidth(context, 0.04),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Obx(
          () {
            List listTopMovie = controller.state.listTopMovie;
            if (listTopMovie.isEmpty) {
              return showLoadingData(context);
            }
            return GridView.builder(
              itemCount: listTopMovie.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 186 / 248,
              ),
              itemBuilder: (context, index) {
                final item = listTopMovie[index];
                return MovieItem(item: item);
              },
            );
          },
        ),
      ),
    );
  }
}
