import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/video_play_controller.dart';

class VideoPlayBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(VideoPlayController());
  }
}
