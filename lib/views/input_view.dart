import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videotext/Controllers/home_controller.dart';

import '../main.dart';

class InputText extends StatelessWidget {
  InputText({Key? key}) : super(key: key);

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 15.0, left: 15),
          //   child: Container(
          //     alignment: Alignment.center,
          //     height: 40,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(12),
          //       color: Colors.blueAccent,
          //     ),
          //     padding: const EdgeInsets.only(left: 15, right: 0),
          //     child: TextFormField(
          //       onChanged: (text) {
          //         editingText.value = text;
          //         // print('Editing Text:::::: ${editingText.value}');
          //       },
          //       style: const TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.normal,
          //       ),
          //       cursorColor: Colors.white,
          //       decoration: InputDecoration(
          //         border: InputBorder.none,
          //         // fillColor: primaryColor,
          //         suffixIcon: IconButton(
          //           padding: const EdgeInsets.only(bottom: 0),
          //           icon: const Icon(Icons.edit, color: Colors.white),
          //           onPressed: () {
          //             FocusScope.of(context).unfocus();
          //           },
          //         ),
          //         hintText: 'Text Here',
          //         hintStyle: const TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
          // TextField(
          //   decoration: InputDecoration(
          //     label: Text('Type Your Text Here'),
          //   ),
          //   onChanged: (text) {
          //     editingText.value = text;
          //     print('Editing Text:::::: ${editingText.value}');
          //   },
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.blue,
              ),
              onChanged: (text) {
                editingText.value = text;
                // print('Editing Text:::::: ${editingText.value}');
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.edit),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                labelText: 'Enter your text here',
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  color: primaryColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            return isLoading.value!
                ? const CircularProgressIndicator()
                : MaterialButton(
                    color: primaryColor,
                    onPressed: () async {
                      await homeController.saveVideo();
                      // Get.to(() => PlayVideo(), binding: VideoBindings());
                    },
                    child: const Text('Add & Save Video'));
          }),
        ],
      )),
    );
  }
}
