import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:lft_new_project/models/image_model.dart';
import 'package:lft_new_project/models/restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopRestaurantProvider with ChangeNotifier {
  List<Restaurant> _restaurants = [];
  List<Restaurant> get restaurants => _restaurants;
  Future<void> getRestaurants() async {
    try {
      // Token
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      print('token: $token');
      // Declarations
      final response = await http.get(
        Uri.parse(Api.url + Api.restaurant),
        headers: {
          'Content-Type': 'application/json',
          'X-Requested-With': "XMLHttpRequest",
          'Authorization': 'Bearer $token',
        },
      );
      var responseData = json.decode(response.body);
      List<Restaurant> extractedRestaurant = [];
      for (var element in responseData) {
        // Images
        List<ImageModel> extractedImages = [];
        for (var ele in element['images']) {
          if (element['images'].isNotEmpty) {
            extractedImages.add(
              ImageModel(id: ele['id'], url: ele['url'] ?? ''),
            );
          }
        }
        // Restaurants
        extractedRestaurant.add(
          Restaurant(
            id: element['id'],
            name: element['name'] ?? '',
            description: element['description'] ?? '',
            images: extractedImages,
          ),
        );
      }
      _restaurants = extractedRestaurant;
      print('responseData');
      print(responseData);
      notifyListeners();
    } catch (err) {
      print('err');
      print(err);
      rethrow;
    }
  }
}
