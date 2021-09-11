import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controllers/home_controller.dart';
import 'views/home_view.dart';

final MaterialColor primaryColor = Colors.blue;

void main() {
  Get.put(HomeController());
  runApp(const MyFlutterApp());
}

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
