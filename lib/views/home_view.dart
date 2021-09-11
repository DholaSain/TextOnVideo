import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videotext/Controllers/home_controller.dart';

import '../main.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                color: primaryColor,
                child: const Text(' Pick Video from Gallery '),
                onPressed: () {
                  controller.pickVideoFromGallery();
                }),
            MaterialButton(
                color: primaryColor,
                child: const Text('Pick Video from Camera'),
                onPressed: () {
                  controller.pickVideoFromCamera();
                }),
            // Text('Screen'),
          ],
        ),
      ),
    );
  }
}
