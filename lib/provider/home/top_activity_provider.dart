import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/api.dart';
import 'package:lft_new_project/models/activity_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/image_model.dart';

class TopActivityProvider with ChangeNotifier {
  List<ActivityModel> _activities = [];
  List<ActivityModel> get activities => _activities;
  // Fct
  Future<void> getActivities() async {
    // Token
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      // Declarations
      final response = await http.get(
        Uri.parse(Api.url + Api.activities),
        headers: {
          'Content-Type': 'application/json',
          'X-Requested-With': "XMLHttpRequest",
          'Authorization': 'Bearer $token',
        },
      );
      var responseData = json.decode(response.body);
      List<ActivityModel> extractedActivityModel = [];
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
        // ActivityModels
        extractedActivityModel.add(
          ActivityModel(
              id: element['id'],
              name: element['name'] ?? '',
              description: element['description'] ?? '',
              images: extractedImages,
              categoryID: element['categoryId'] ?? 0,
              favouriteCount: element['favourite_count'] ?? 0,
              likedCount: element['liked_count'] ?? 0,
              latitude: (element['latitude'] ?? 0).toDouble(),
              longitude: (element['longitude'] ?? 0).toDouble(),
              haveDiscount: element['haveDiscount'] ?? 0,
              avgRating: element['avgAvis'] ?? 0),
        );
      }
      _activities = extractedActivityModel;
      print('responseData Activities');
      print(responseData);
      notifyListeners();
    } on Exception catch (err) {
      print('err');
      print(err);
      rethrow;
    }
  }
}
