import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../common/utils/api.dart';
import '../../models/image_model.dart';
import '../../models/restaurant.dart';

class MainCategoryProvider with ChangeNotifier {
  bool _loading = false;
  bool get laoding => _loading;
  // Restaurants
  List<Restaurant> _restaurants = [];
  List<Restaurant> get restaurants => _restaurants;
  // Sub Category Name
  final String _subCategoryName = '';
  String get subCategoryName => _subCategoryName;
  //
  Future<void> getInfoFct() async {
    _restaurants = [];

    //token
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

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
            discount: (element['haveDiscount'] ?? 0) == 1 ? true : false,
          ),
        );
      }
      _restaurants = extractedRestaurant;

      notifyListeners();
    } catch (err) {
      print('err');
      print(err);
      rethrow;
    }
  }

  void getCategorySubCategoryName(String subCategoryName) {
    if (subCategoryName.contains(ConstantsClass.laFamilleGourmandeName)) {}
    notifyListeners();
  }

  void loadingFct(bool isLoading) {
    _loading = isLoading;
    notifyListeners();
  }
}
