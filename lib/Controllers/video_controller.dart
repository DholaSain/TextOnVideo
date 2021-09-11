import 'dart:io';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:videotext/Controllers/home_controller.dart';

class VideoController extends GetxController {
  final Rxn<VideoPlayerController> videoController =
      Rxn<VideoPlayerController>();
  @override
  void onInit() {
    super.onInit();
    videoController.value =
        VideoPlayerController.file(File(curruntVideoPath.value!))
          ..initialize().then((value) {});
  }

  @override
  void onClose() {
    super.onClose();
    videoController.value!.dispose();
  }
}
