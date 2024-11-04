import 'package:flutter/material.dart';
import 'package:noviindus_machinetest/core/constants.dart';
import 'package:noviindus_machinetest/presentation/add_feed_screen/view/addfeedscreen.dart';
import 'package:noviindus_machinetest/presentation/home_screen/widgets/filterwidget.dart';
import 'package:noviindus_machinetest/presentation/home_screen/widgets/postwidget.dart';
import 'package:noviindus_machinetest/presentation/home_screen/widgets/postwidgetloading.dart';
import 'package:noviindus_machinetest/providers/authprovider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<Authprovider>(context, listen: false);
    provider.home();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Constants.red,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddFeedScreen()));
        },
        child: const Icon(
          Icons.add,
          color: Constants.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Maria',
                        style: TextStyle(
                          fontSize: 20,
                          color: Constants.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
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
                  CircleAvatar(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const FilterWidget(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Consumer<Authprovider>(
                builder: (context, value, child) {
                  if (value.homeModel != null) {
                    return ListView.separated(
                      itemCount: value.homeModel!.results.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          color: const Color.fromARGB(255, 24, 24, 24),
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return PostWidget(
                          index: index,
                          size: size,
                          list: value.homeModel!.results,
                        );
                      },
                    );
                  }
                  return ListView.separated(
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        color: const Color.fromARGB(255, 24, 24, 24),
                        height: 5,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return PostWidgetLoading(
                        size: size,
                        index: index,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
