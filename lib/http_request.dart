import 'dart:convert';

import 'package:http/http.dart' as http;

import 'login_model.dart';

class ApiRequest {
  Future<LoginModel?> login() async {
    LoginModel? finalResponse;

    try {
      http.Response response = await http.post(
          Uri.parse('https://osamapro.online/api/login'),
          body: {'email': 'a@a.a', 'password': '123'});

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.body);
        LoginModel? loginModel = LoginModel.fromJson(decodedJson);

        finalResponse = loginModel;
      } else {}
    } catch (e) {
      print('login service $e');
    }

    return finalResponse;
  }
}
