import 'package:flutter/material.dart';
import 'package:noviindus_machinetest/core/constants.dart';
import 'package:noviindus_machinetest/presentation/otp_screen/view/otp_screen.dart';
import 'package:noviindus_machinetest/providers/authprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Authprovider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.greyBG,
        ),
        home: OtpScreen(),
      ),
    );
  }
}
