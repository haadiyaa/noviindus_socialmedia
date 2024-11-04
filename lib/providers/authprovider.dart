import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:noviindus_machinetest/core/constants.dart';
import 'package:noviindus_machinetest/data/models/categorymodel.dart';
import 'package:noviindus_machinetest/data/models/homemodel.dart';
import 'package:noviindus_machinetest/data/models/otpmodel.dart';
import 'package:noviindus_machinetest/reposiitory/apirepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authprovider extends ChangeNotifier {
  OtpModel? otpModel;
  HomeModel? homeModel;
  CategoryModel? categoryModel;
  List<Category> list = [];
  String msg = '';
  Future<void> otpVerify({required String code, required String phone}) async {
    var sharedPref = await SharedPreferences.getInstance();
    try {
      final response =
          await ApiRepository.otpVerification(code: code, phone: phone);
      final data = jsonDecode(response.body);
      print('otp res: $data');
      if (response.statusCode == 202) {
        otpModel = OtpModel.fromJson(data);
        await sharedPref.setString(
            Constants.key, otpModel!.token.access.toString());
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

  Future<void> category() async {
    try {
      final response = await ApiRepository.category();
      final data = jsonDecode(response.body);
      print('otp res: $data');
      if (response.statusCode == 202) {
        categoryModel = CategoryModel.fromJson(data);
        for (var element in categoryModel!.categories) {
          list.add(element);
        }
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
