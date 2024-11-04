import 'package:flutter/material.dart';
import 'package:noviindus_machinetest/core/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller,
    this.validator,
  });

  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
        color: Constants.white,
      ),
      keyboardType: TextInputType.phone,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(
          color: Constants.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Constants.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Constants.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Constants.white,
          ),
        ),
      ),
    );
  }
}
