import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/home_controller.dart';
import 'package:moviegetx/pages/home/widgets/home_header.dart';
import 'package:moviegetx/pages/home/widgets/home_new_release_movie.dart';
import 'package:moviegetx/pages/home/widgets/home_now_playing.dart';
import 'package:moviegetx/pages/home/widgets/home_top_week_movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeHeader(
            controller: controller,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                HomeTopWeekMovie(
                  controller: controller,
                  nameTitle: 'Top Movies This Week',
                  function: controller.goToTopMovie,
                ),
                HomeNewReleaseMovie(
                  controller: controller,
                  nameTitle: 'New Release Movie',
                  function: controller.goToNewReleaseMovie,
                ),
                HomeNowPlaying(
                  controller: controller,
                  nameTitle: 'Now Playing Movie',
                  function: controller.goToNowPlayingMovie,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
