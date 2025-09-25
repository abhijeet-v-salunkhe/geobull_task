import 'package:flutter/material.dart';
import 'package:geobull_task/features/sign_up/controller/sign_up_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(
              controller.nameController.text,
              style: TextStyle(fontSize: 30),
            ),

            Text(controller.mobileNumberController.text),
            Text(controller.emailController.text),
          ],
        ),
      ),
    );
  }
}
