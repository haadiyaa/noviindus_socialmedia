import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:noviindus_machinetest/data/models/homemodel.dart';
import 'package:noviindus_machinetest/data/models/otpmodel.dart';
import 'package:noviindus_machinetest/reposiitory/apirepository.dart';

class Authprovider extends ChangeNotifier {
  OtpModel? otpModel;
  HomeModel? homeModel;
  String msg = '';
  Future<void> otpVerify({required String code, required String phone}) async {
    try {
      final response =
          await ApiRepository.otpVerification(code: code, phone: phone);
      final data = jsonDecode(response.body);
      print('otp res: $data');
      if (response.statusCode == 202) {
        otpModel = OtpModel.fromJson(data);
        msg = 'Login Success!';
        print('access: ${otpModel!.token.access}');
      } else {
        msg = 'Login Failed!';
        print('failed');
      }
    } catch (e) {
      msg = e.toString();
      print('otp exc: ${e.toString()}');
    } finally {
      notifyListeners();
    }
  }

  Future<void> home() async {
    try {
      final response = await ApiRepository.home();
      final data = jsonDecode(response.body);
      print('otp res: $data');
      if (response.statusCode == 202) {
        homeModel = HomeModel.fromJson(data);
        msg = 'Home Success!';
      } else {
        msg = 'Home Failed!';
        print('failed');
      }
    } catch (e) {
      msg = e.toString();
      print('home exc: ${e.toString()}');
    } finally {
      notifyListeners();
    }
  }
}
