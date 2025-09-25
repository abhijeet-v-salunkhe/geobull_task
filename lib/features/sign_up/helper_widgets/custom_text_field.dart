import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.fieldName,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.hintText,
  });

  final String fieldName;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(fieldName),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
          ),
          controller: controller,
          obscureText: obscureText,
          validator: validator,
        ),
      ],
    );
  }
}
