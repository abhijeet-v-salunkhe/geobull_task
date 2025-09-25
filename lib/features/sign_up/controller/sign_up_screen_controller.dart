import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:geobull_task/core/network/firebase_set_up.dart';
import 'package:geobull_task/features/home/home_screen.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the name";
    }
    return null;
  }

  String? mobileNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the mobile number";
    } else if (value.length != 10) {
      return "Please enter the 10 digit mobile number";
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the email";
    }
    bool isValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    if (!isValid) {
      return "Please enter the valid email";
    }
    return null;
  }

  Future<void> submitData() async {
    try {
      isLoading = true;
      update();
      FirebaseFirestore db = FirebaseFirestore.instance;

      final Map<String, dynamic> data = {
        "name": nameController.text,
        "mobile": mobileNumberController.text,
        "email": emailController.text,
      };
      //
      // DocumentReference docRef = await db.collection("users").add(data);

      String? id = await FirebaseSetUp().postData(
        data: data,
        collectionName: "users",
      );
      if (id != null) {
        Get.to(HomeScreen());
        log("Doc Ref id : $id");
      }

      isLoading = false;
    } catch (e) {
      isLoading = false;
      log("Exception during submit to FirebaseFirestore : $e");
    } finally {
      update();
    }
  }
}
