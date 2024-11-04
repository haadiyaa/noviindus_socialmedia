import 'package:flutter/material.dart';
import 'package:noviindus_machinetest/core/constants.dart';
import 'package:noviindus_machinetest/providers/authprovider.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Consumer<Authprovider>(
        builder: (context, value, child) {
          if (value.homeModel != null) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: value.homeModel!.categoryDict.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 15,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                final list = value.homeModel!.categoryDict.reversed.toList();
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Constants.white,
                      width: 1,
                    ),
                    color: Constants.greyBG,
                  ),
                  child: Center(
                    child: Text(
                      list[index].title,
                      style: const TextStyle(
                        color: Constants.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Constants.white,
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'data',
                    style: TextStyle(
                      color: Constants.white,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
