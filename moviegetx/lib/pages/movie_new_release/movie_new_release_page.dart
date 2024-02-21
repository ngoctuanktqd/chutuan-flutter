import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_icon_search.dart';
import 'package:moviegetx/apps/widgets/movie_item.dart';
import 'package:moviegetx/managers/controllers/movie_new_release_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MovieNewReleasePage extends GetView<MovieNewReleaseController> {
  const MovieNewReleasePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Release Movies',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          const ButtonIconSearch(),
          getWidth(context, 0.04),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SmartRefresher(
          controller: controller.refreshController,
          // enableRefreshVibrate  lam moi
          enablePullDown: true,
          onRefresh: controller.onRefresh,
          // them moi
          enablePullUp: true,
          onLoading: controller.onLoading,
          // Show du lieu
          child: Obx(
            () {
              List listNewReleaseMovie = controller.state.listNewReleaseMovie;
              if (listNewReleaseMovie.isEmpty) {
                return showLoadingData(context);
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listNewReleaseMovie.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 186 / 248,
                ),
                itemBuilder: (context, index) {
                  final item = listNewReleaseMovie[index];
                  return MovieItem(item: item);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
