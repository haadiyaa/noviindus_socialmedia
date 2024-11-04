import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:noviindus_machinetest/core/apikeys.dart';

class ApiRepository {
  static Future<http.Response> otpVerification(
      {required String code, required String phone}) async {
    const url = '${Apikeys.base}${Apikeys.otp}';
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    request.fields['country_code'] = code;
    request.fields['phone'] = phone;

    request.headers.addAll({"Content-Type": "multipart/form-data"});
    http.StreamedResponse response = await request.send();
    http.Response httpResponse = await http.Response.fromStream(response);
    return httpResponse;
  }

  static Future<http.Response> addFeed({
    required String desc,
    required File image,
    required List<String> categories,
  }) async {
    const url = '${Apikeys.base}${Apikeys.feed}';
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    for (var item in categories) {
      request.files.add(http.MultipartFile.fromString('category', item));
    }
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        image.path,
      ),
    );
    // request.fields['video'] = code;
    // request.fields['desc'] = desc;

    request.headers.addAll({"Content-Type": "multipart/form-data"});
    http.StreamedResponse response = await request.send();
    http.Response httpResponse = await http.Response.fromStream(response);
    return httpResponse;
  }

  static Future<http.Response> category() async {
    final response =
        await http.get(Uri.parse('${Apikeys.base}${Apikeys.category}'));
    return response;
  }

  static Future<http.Response> home() async {
    final response =
        await http.get(Uri.parse('${Apikeys.base}${Apikeys.home}'));
    return response;
  }
}
