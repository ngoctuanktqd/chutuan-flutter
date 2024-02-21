import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_icon_search.dart';
import 'package:moviegetx/apps/widgets/movie_item.dart';
import 'package:moviegetx/managers/controllers/movie_now_playing_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MovieNowPlayingPage extends GetView<MovieNowPlayingController> {
  const MovieNowPlayingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Now Playing',
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
              List listMovieNowPlaying = controller.state.listMovieNowPlaying;
              if (listMovieNowPlaying.isEmpty) {
                return showLoadingData(context);
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listMovieNowPlaying.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 186 / 248,
                ),
                itemBuilder: (context, index) {
                  final item = listMovieNowPlaying[index];
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
