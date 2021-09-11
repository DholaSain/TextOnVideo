import 'package:get/get.dart';
import 'package:videotext/Controllers/video_controller.dart';

class VideoBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoController>(() => VideoController());
  }
}
