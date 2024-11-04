import 'package:flutter/material.dart';
import 'package:noviindus_machinetest/core/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.greyBG,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Maria',
              style: TextStyle(
                  color: Constants.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome back to Section',
              style: TextStyle(
                color: Constants.white,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: const [
          CircleAvatar(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
