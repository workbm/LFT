import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lft_new_project/common/utils/api.dart';
import 'package:lft_new_project/common/utils/http_exception.dart';
import 'package:lft_new_project/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupProvider with ChangeNotifier {
  final UserModel _userModel = UserModel(
      id: 0, name: '', email: '', birthDate: '', city: '', country: '');
  UserModel get userModel => _userModel;
  // SigUP Fct
  Future<void> signUpFct(String firstName, String postalCode, String email,
      String birthdate, String password, String city, String country) async {
    final url = Uri.parse(Api.url + Api.signUP);
    try {
      final prefs = await SharedPreferences.getInstance();
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'X-Requested-With': "XMLHttpRequest"
          },
          body: jsonEncode({
            'firstName': firstName,
            'postalCode': postalCode,
            'email': email,
            'birthdate': birthdate,
            'password': password,
            'city': city,
            'country': country,
          }));
      var responseData = json.decode(response.body);
      if (responseData['errors'] != null) {
        print('emmail : ${responseData['errors']['email'][0]}');
        if (responseData['errors']['email'][0] != null) {
          print('responseData throwException');
          throw HttpExceptionClass(responseData['errors']['email'][0]);
        }
      }
      // SharedPreferences
      prefs.setString('token', responseData['data']['token']);
      prefs.setInt('id', responseData['profil']['id'] ?? 0);
      prefs.setString('email', responseData['profil']['email'] ?? '');
      prefs.setString('name', responseData['profil']['firstName'] ?? '');
      prefs.setString('city', responseData['profil']['city'] ?? '');
      prefs.setString('country', responseData['profil']['country'] ?? '');
      prefs.setString('birthDate', responseData['profil']['birthdate'] ?? '');
      prefs.setString('picture', responseData['profil']['picture'] ?? '');
      // if (response.statusCode != 200) {
      //   print('object');
      //   throw const HttpException('Error');
      // }
      // var userProfile = responseData['profil'];
      // // User Info
      // _userModel = UserModel(
      //   id: userProfile['id'],
      //   name: userProfile['firstName'],
      //   email: userProfile['email'],
      //   birthDate: userProfile['birthdate'],
      //   city: userProfile['city'],
      //   country: userProfile['country'],
      // );
      // Store User Data Locally
      // prefs.setInt('userID', userProfile['id']);
      // prefs.setString('name', userProfile['firstName']);
      // prefs.setString('email', userProfile['email']);
      // Exceptions

      print('responseData');
      print(responseData);
      notifyListeners();
    } catch (err) {
      print('err in signup provider');
      print(err);
      rethrow;
    }
  }
}
