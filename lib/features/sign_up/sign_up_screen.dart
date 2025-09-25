import 'package:flutter/material.dart';
import 'package:geobull_task/core/common/widgets/common_button.dart';
import 'package:geobull_task/core/constants/color_constants.dart';
import 'package:geobull_task/features/sign_up/controller/sign_up_screen_controller.dart';
import 'package:geobull_task/features/sign_up/helper_widgets/custom_text_field.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Sign Up"), centerTitle: true),
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: GetBuilder(
              init: SignUpScreenController(),
              builder: (controller) => Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        spacing: 10,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          CustomTextField(
                            hintText: "Mahesh",
                            fieldName: "Name",
                            controller: controller.nameController,
                            validator: (value) =>
                                controller.nameValidator(value),
                          ),
                          CustomTextField(
                            hintText: "8556817033",
                            fieldName: "Mobile",
                            controller: controller.mobileNumberController,
                            validator: (value) =>
                                controller.mobileNumberValidator(value),
                            keyboardType: TextInputType.phone,
                          ),

                          CustomTextField(
                            hintText: "mahesh234@gami.com",
                            fieldName: "Email",
                            controller: controller.emailController,
                            validator: (value) =>
                                controller.emailValidator(value),
                          ),
                          SizedBox(height: 6),
                          CommonButton(
                            child: controller.isLoading
                                ? CircularProgressIndicator()
                                : Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                            onTap: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.submitData();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
