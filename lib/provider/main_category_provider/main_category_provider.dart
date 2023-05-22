import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/constants.dart';
import 'package:lft_new_project/models/category_model.dart';
import 'package:lft_new_project/models/service_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../common/utils/api.dart';
import '../../models/comment_model.dart';
import '../../models/image_model.dart';
import '../../models/review_model.dart';
import '../../models/tag.dart';
import '../../models/user_model.dart';

class MainCategoryProvider with ChangeNotifier {
  bool _loading = false;
  bool get laoding => _loading;
  // APi
  String _categoryUrl = '';
  String get categoryUrl => _categoryUrl;
  int _categoryID = 1;
  int get categoryID => _categoryID;
  //
  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;
  String _mainCategoryImage = '';
  String get mainCategoryImage => _mainCategoryImage;
  String _mainCategoryTitle = '';
  String get mainCategoryTitle => _mainCategoryTitle;
  String _categoryTitle = '';
  String get categoryTitle => _categoryTitle;
  // Restaurants
  List<ServiceModel> _services = [];
  List<ServiceModel> get services => _services;
  // Sub Category Name
  final String _subCategoryName = '';
  String get subCategoryName => _subCategoryName;
  //
  Future<void> getInfoFct() async {
    _services = [];
    //
    try {
      //token
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
      List<ServiceModel> extractedRestaurants = [];
      for (var element in responseData) {
        // Images
        List<ImageModel> extractedImages = [];
        if (element['images'] != null) {
          for (var ele in element['images']) {
            if (element['images'].isNotEmpty) {
              extractedImages.add(
                ImageModel(
                  id: ele['id'],
                  url: Api.urlWithoutApi + (ele['url'] ?? ''),
                ),
              );
            }
          }
        }
        // Comments
        List<CommentModel> extractedComments = [];
        if (element['comments'] != null) {
          for (var ele in element['comments']) {
            if (element['comments'].isNotEmpty) {
              final userMap = ele['user'];
              extractedComments.add(CommentModel(
                id: ele['id'] ?? 0,
                userID: ele['userId'] ?? 0,
                serviceID: ele['restaurantId'] ?? '',
                rating: (ele['avis'] ?? 0).toDouble(),
                time: DateTime.now(),
                review: ReviewModel(
                  id: 0,
                  userID: 0,
                  serviceID: 0,
                  rating: (ele['avis'] ?? 0).toDouble(),
                  time: DateTime.now(),
                ),
                user: UserModel(
                    id: userMap['id'] ?? 0,
                    name: userMap['firstName'] ?? 'name',
                    email: userMap['email'] ?? 'email',
                    birthDate: userMap['birthdate'] ?? '',
                    city: userMap['city'] ?? '',
                    country: userMap['country'] ?? ''),
              ));
            }
          }
        }
        // Reviews
        List<ReviewModel> extractedReviews = [];
        if (element['avis'] != null) {
          if (element['avis'].isNotEmpty) {
            for (var ele in element['avis']) {
              extractedReviews.add(ReviewModel(
                  id: ele['id'] ?? 0,
                  userID: ele['userId'] ?? 0,
                  serviceID: 0,
                  rating: (ele['avis'] ?? 0).toDouble(),
                  time: DateTime.now()));
            }
          }
        }
        // Tags
        List<TagModel> extractedTags = [];
        if (element['tags'] != null) {
          if (element['tags'].isNotEmpty) {
            for (var ele in element['tags']) {
              extractedTags.add(
                TagModel(id: ele['id'] ?? 0, name: ele['name'] ?? ''),
              );
            }
          }
        }
        // Restaurants
        extractedRestaurants.add(
          ServiceModel(
            id: element['id'],
            name: element['name'] ?? '',
            description: element['description'] ?? '',
            images: extractedImages,
            categoryID: element['categoryId'] ?? 0,
            favouriteCount: element['favourite_count'] ?? 0,
            liked: (element['like'] ?? 0) == 0 ? false : true,
            likedCount: element['liked_count'] ?? 0,
            latitude: (element['latitude'] ?? 0).toDouble(),
            longitude: (element['longitude'] ?? 0).toDouble(),
            haveDiscount: (element['haveDiscount'] ?? 0) == 0 ? false : true,
            avgRating: (element['avgAvis'] ?? 0).toDouble(),
            remise: 0,
            commentList: extractedComments,
            reviewList: extractedReviews,
            tagList: extractedTags,
          ),
        );
      }
      _services = extractedRestaurants;

      notifyListeners();
    } catch (err) {
      print('err');
      print(err);
      rethrow;
    }
  }

  void getCategoryInfo(
      String mainCategoryTitle,
      String mainCategoryImage,
      String categorytitle,
      String categoryURL,
      int categoryId,
      List<CategoryModel> categoryList) {
    _mainCategoryTitle = mainCategoryTitle;
    _categoryTitle = categorytitle;
    _mainCategoryImage = mainCategoryImage;
    _categoryUrl = categoryURL;
    _categoryID = categoryId;
    _categoryList = categoryList;
    notifyListeners();
  }

  void getCategoryMustInfo(
    String categoryURL,
    int categoryId,
  ) {
    _categoryUrl = categoryURL;
    _categoryID = categoryId;
    notifyListeners();
  }

  // Navigate To A Specific Category
  void goToSpecificCategory(String mainCategoryNameArg) {
    // LA FAMILLE GOURMANDE
    if (mainCategoryNameArg.contains(ConstantsClass.laFamilleGourmandeName)) {
      _mainCategoryTitle = ConstantsClass.laFamilleGourmandeName;
      _categoryTitle = (ConstantsClass.catygories[ConstantsClass
              .laFamilleGourmandeName]!['catygories'] as List<CategoryModel>)
          .first
          .name;
      _mainCategoryImage = ConstantsClass.laFamilleGourmandeImage;
      _categoryUrl = Api.restaurantByCategory;
      _categoryID = 1;
      _categoryList = (ConstantsClass
              .catygories[ConstantsClass.laFamilleGourmandeName]!['catygories']
          as List<CategoryModel>);
    }
    // LA FAMILLE S'AMUSE
    if (mainCategoryNameArg.contains(ConstantsClass.laFamilleSamuseName)) {
      _mainCategoryTitle = ConstantsClass.laFamilleSamuseName;
      _categoryTitle = (ConstantsClass
                  .catygories[ConstantsClass.laFamilleSamuseName]!['catygories']
              as List<CategoryModel>)
          .first
          .name;
      _mainCategoryImage = ConstantsClass.laFamilleSamuseImage;
      _categoryUrl = Api.activitiesByCategory;
      _categoryID = 1;
      _categoryList = (ConstantsClass
              .catygories[ConstantsClass.laFamilleSamuseName]!['catygories']
          as List<CategoryModel>);
    }
    // LA FAMILLE DÉCOUVRE/VISITE
    if (mainCategoryNameArg.contains(ConstantsClass.laFamilleVisiteName)) {
      _mainCategoryTitle = ConstantsClass.laFamilleVisiteName;
      _categoryTitle = (ConstantsClass
                  .catygories[ConstantsClass.laFamilleVisiteName]!['catygories']
              as List<CategoryModel>)
          .first
          .name;
      _mainCategoryImage = ConstantsClass.laFamilleVisiteImage;
      _categoryUrl = Api.visiteByCategory;
      _categoryID = 1;
      _categoryList = (ConstantsClass
              .catygories[ConstantsClass.laFamilleVisiteName]!['catygories']
          as List<CategoryModel>);
    }
    // LA FAMILLE SHOPPE
    if (mainCategoryNameArg.contains(ConstantsClass.laFamilleShopName)) {
      _mainCategoryTitle = ConstantsClass.laFamilleShopName;
      _categoryTitle = (ConstantsClass
                  .catygories[ConstantsClass.laFamilleShopName]!['catygories']
              as List<CategoryModel>)
          .first
          .name;
      _mainCategoryImage = ConstantsClass.laFamilleShopImage;
      _categoryUrl = Api.shopByCategory;
      _categoryID = 1;
      _categoryList = (ConstantsClass
              .catygories[ConstantsClass.laFamilleShopName]!['catygories']
          as List<CategoryModel>);
    }
    // INFOS PRATIQUES
    if (mainCategoryNameArg.contains(ConstantsClass.infosPratiquesName)) {
      _mainCategoryTitle = ConstantsClass.infosPratiquesName;
      _categoryTitle = (ConstantsClass
                  .catygories[ConstantsClass.infosPratiquesName]!['catygories']
              as List<CategoryModel>)
          .first
          .name;
      _mainCategoryImage = ConstantsClass.infosPratiquesImage;
      _categoryUrl = Api.restaurantByCategory;
      _categoryID = 1;
      _categoryList = (ConstantsClass
              .catygories[ConstantsClass.infosPratiquesName]!['catygories']
          as List<CategoryModel>);
    }
    notifyListeners();
  }

  void loadingFct(bool isLoading) {
    _loading = isLoading;
    notifyListeners();
  }
}
