import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../common/utils/api.dart';
import '../../models/image_model.dart';
import '../../models/restaurant.dart';

class MainCategoryProvider with ChangeNotifier {
  bool _loading = false;
  bool get laoding => _loading;
  // APi
  String _categoryUrl = '';
  String get categoryUrl => _categoryUrl;
  int _categoryID = 0;
  int get categoryID => _categoryID;
  //
  // String _title = '';
  // String get title => _title;
  String _mainCategoryImage = '';
  String get mainCategoryImage => _mainCategoryImage;
  String _mainCategoryTitle = '';
  String get mainCategoryTitle => _mainCategoryTitle;
  String _categoryTitle = '';
  String get categoryTitle => _categoryTitle;
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
      final url = Uri.parse('${Api.url}$_categoryUrl$_categoryID');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'X-Requested-With': "XMLHttpRequest",
          'Authorization': 'Bearer $token',
        },
      );
      var responseData = json.decode(response.body);
      print('responseData');
      print(responseData);
      List<Restaurant> extractedRestaurant = [];
      for (var element in responseData) {
        // Images
        List<ImageModel> extractedImages = [];
        if (element['images'] != null) {
          for (var ele in element['images']) {
            if (element['images'].isNotEmpty) {
              extractedImages.add(
                ImageModel(id: ele['id'], url: ele['url'] ?? ''),
              );
            }
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

  void getCategoryInfo(String mainCategoryTitle, String mainCategoryImage,
      String categorytitle, String categoryURL, int categoryId) {
    _mainCategoryTitle = mainCategoryTitle;
    _categoryTitle = categorytitle;
    _mainCategoryImage = mainCategoryImage;
    _categoryUrl = categoryURL;
    _categoryID = categoryId;
    notifyListeners();
  }

  void loadingFct(bool isLoading) {
    _loading = isLoading;
    notifyListeners();
  }
}
