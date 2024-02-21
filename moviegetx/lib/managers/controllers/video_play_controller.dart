import 'package:get/get.dart';
import 'package:moviegetx/managers/states/video_play_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//class VideoPlayController extends GetxController with StateMixin {}
class VideoPlayController extends GetxController {
  final state = VideoPlayState();
  @override
  void onInit() {
    state.item = Get.arguments;
    state.playController = YoutubePlayerController(
      initialVideoId: state.item.key,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );

    // TODO: implement onInit
    super.onInit();
  }
}
