import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tapioca/tapioca.dart';
import 'package:videotext/views/input_view.dart';
import 'package:videotext/views/play_video.dart';

Rxn<String> curruntVideoPath = Rxn<String>();
Rxn<String> editingText = Rxn<String>();
Rxn<bool> isLoading = Rxn<bool>(false);

class HomeController extends GetxController {
  final Rxn<XFile> videoFile = Rxn<XFile>();
  final ImagePicker _picker = ImagePicker();

  pickVideoFromGallery() async {
    try {
      XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
      if (video != null) {
        videoFile.value = video;
        Get.to(() => InputText());
        Get.snackbar(
          'Successfuly Picked Video',
          videoFile.value!.path,
        );
      }
    } catch (error) {
      Get.snackbar(
          'Error Picking Video', 'Something bad happened in picking video',
          backgroundColor: Colors.red);
      // print('Video Picking Error:::: $error');
    }
  }

  pickVideoFromCamera() async {
    try {
      XFile? video = await _picker.pickVideo(source: ImageSource.camera);
      if (video != null) {
        videoFile.value = video;
        Get.to(() => InputText());
        Get.snackbar(
          'Successfuly Picked Video',
          videoFile.value!.path,
        );
      }
    } catch (error) {
      Get.snackbar(
          'Error Picking Video', 'Something bad happened in picking video',
          backgroundColor: Colors.red);
      // print('Video Picking Error:::: $error');
    }
  }

  editVideo() async {
    final tapiocaBalls = [
      TapiocaBall.textOverlay(editingText.value ?? 'default', 100, 10, 100,
          const Color(0xffffc0cb)),
    ];
    return tapiocaBalls;
  }

  saveVideo() async {
    isLoading.value = true;
    try {
      var tempDir = await getTemporaryDirectory();
      var overLay = await editVideo();
      final path =
          '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}result.mp4';
      // print(tempDir);
      final cup = Cup(Content(videoFile.value!.path), overLay);
      cup.suckUp(path).then((_) async {
        // curruntVideoPath.value = path;
        // print("finished");
        // print(path);
        await GallerySaver.saveVideo(path).then((bool? success) {
          // print(success.toString());
          curruntVideoPath.value = path;
        });
        if (curruntVideoPath.value == null) {
          return;
        } else {
          Get.to(() => VideoScreen());
          // Get.to(PlayVideo(), binding: VideoBindings());
        }

        isLoading.value = false;
      });
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error Saving Video', e.toString());
    }
  }
}
