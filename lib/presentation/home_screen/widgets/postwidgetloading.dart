
import 'package:flutter/material.dart';
import 'package:noviindus_machinetest/core/constants.dart';

class PostWidgetLoading extends StatelessWidget {
  const PostWidgetLoading({
    super.key,
    required this.size,
    required this.index,
  });
  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // color: Constants.grey,
          ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anagha Krishna',
                      style: TextStyle(
                        color: Constants.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '5 dayse ago',
                      style: TextStyle(
                        color: Constants.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.6,
            color: Constants.grey,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Leo ac lorem faucli bus facilisis tellus. At vitae dis commodo nunc sollicitudin elementum suspendisse...',
              style: TextStyle(
                fontSize: 16,
                color: Constants.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
