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

  static Future<http.Response> home() async {
    final response =
        await http.get(Uri.parse('${Apikeys.base}${Apikeys.home}'));
    return response;
  }
}
