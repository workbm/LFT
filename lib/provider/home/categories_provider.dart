import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lft_new_project/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../common/utils/api.dart';

class CategoriesProvider with ChangeNotifier {
  List<CategoryModel> _familleGourmandeCategories = [];
  List<CategoryModel> get familleGourmandeCategories =>
      _familleGourmandeCategories;
  List<CategoryModel> _familleSamuseCategories = [];
  List<CategoryModel> get familleSamuseCategories => _familleSamuseCategories;
  List<CategoryModel> _familleShopCategories = [];
  List<CategoryModel> get familleShopCategories => _familleShopCategories;
  List<CategoryModel> _familleVisiteCategories = [];
  List<CategoryModel> get familleVisiteCategories => _familleVisiteCategories;
  // FCT
  Future<void> getInfos() async {
    try {
      // Token
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      // Catygories
      final response = await http.get(
        Uri.parse(Api.url + Api.getAllTypesOfCatygories),
        headers: {
          'Content-Type': 'application/json',
          'X-Requested-With': "XMLHttpRequest",
          'Authorization': 'Bearer $token',
        },
      );
      final responseData = json.decode(response.body);
      List<CategoryModel> extractedCategories = [];
      // LA FAMILLE GOURMANDE
      extractedCategories = [];
      for (var element in responseData['restaurantCategories']) {
        extractedCategories
            .add(CategoryModel(id: element['id'], name: element['name']));
      }
      _familleGourmandeCategories = extractedCategories;
      // LA FAMILLE S'AMUSE
      extractedCategories = [];
      for (var element in responseData['activityCategories']) {
        extractedCategories
            .add(CategoryModel(id: element['id'], name: element['name']));
      }
      _familleSamuseCategories = extractedCategories;
      // LA FAMILLE SHOPPE
      extractedCategories = [];
      for (var element in responseData['shoppingCategories']) {
        extractedCategories
            .add(CategoryModel(id: element['id'], name: element['name']));
      }
      _familleShopCategories = extractedCategories;
      // LA FAMILLE DÉCOUVRE/VISITE
      extractedCategories = [];
      for (var element in responseData['publicPlaceCategpries']) {
        extractedCategories
            .add(CategoryModel(id: element['id'], name: element['name']));
      }
      _familleVisiteCategories = extractedCategories;

      notifyListeners();
    } catch (err) {
      print('err');
      print(err);
      rethrow;
    }
  }
}
