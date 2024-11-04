
import 'package:flutter/material.dart';
import 'package:noviindus_machinetest/core/constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
          right: 5,
          top: 8,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Constants.white,
          ),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Constants.white,
          size: 10,
        ),
      ),
    );
  }
}
