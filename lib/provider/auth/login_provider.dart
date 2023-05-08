import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lft_new_project/common/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  Future<dynamic> login(String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Declarations
      final url = Uri.parse(Api.url + Api.login);
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'X-Requested-With': "XMLHttpRequest"
          },
          body: jsonEncode({
            'email': email,
            'password': password,
          }));
      var responseData = json.decode(response.body);

      // SharedPreferences
      prefs.setString('token', responseData['data']['token']);
      //
      print(responseData);
      print('responseData');

      // User infos list
      // prefs.setString('token', responseData['data']['token']);
      notifyListeners();
    } on Exception catch (err) {
      print('err');
      print(err);
      rethrow;
    }
  }
}
