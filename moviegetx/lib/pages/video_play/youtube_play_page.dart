import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/video_play_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayPage extends GetView<VideoPlayController> {
  const YoutubePlayPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: YoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: controller.state.playController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: MovieColor.primary_500,
          topActions: <Widget>[
            getWidth(context, 0.01),
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            Expanded(
              child: Text(
                controller.state.item.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {
                print('Settings Tapped!');
              },
            ),
          ],
          onReady: () {
            print('_isPlayerReady = true');
          },
          onEnded: (data) {
            print('Next Video Started!');
          },
        ),
        builder: (context, player) => Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
              ),
            ),
            title: Text(
              controller.state.item.name,
              style: const TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.video_library_outlined),
                onPressed: () {
                  print('List Video');
                },
              ),
            ],
          ),
          body: Center(child: player),
        ),
      ),
    );
  }
}
