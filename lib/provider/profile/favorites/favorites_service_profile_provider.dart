import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lft_new_project/common/utils/api.dart';
import 'package:lft_new_project/common/utils/constants.dart';
import 'package:lft_new_project/models/service_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/comment_model.dart';
import '../../../models/image_model.dart';
import '../../../models/like_model.dart';
import '../../../models/review_model.dart';
import '../../../models/tag.dart';
import '../../../models/user_model.dart';

class FavoriteServiceProvider with ChangeNotifier {
  List<ServiceModel> _list = [];
  List<ServiceModel> get list => _list;
  // Loading
  bool _loading = false;
  bool get laoding => _loading;
  // Service Choice Api
  String _favoriteApi = Api.favoritesRestaurants;
  String get favoriteApi => _favoriteApi;
  // Main Category Name
  String _mainCategoryName = ConstantsClass.laFamilleGourmandeName;
  String get mainCategoryName => _mainCategoryName;

  Future<void> favoriteFct() async {
    print('favoriteFct');
    // Token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // Declarations
    // var favoriteApi = Api.favoritesRestaurants;
    // // var mainCategoryName = '';
    // if (mainCategoryNameArg.contains(ConstantsClass.laFamilleGourmandeName)) {
    //   favoriteApi = Api.favoritesRestaurants;
    // }
    // if (mainCategoryNameArg.contains(ConstantsClass.laFamilleSamuseName)) {
    //   favoriteApi = Api.favoritesActivities;
    // }
    // if (mainCategoryNameArg.contains(ConstantsClass.laFamilleVisiteName)) {
    //   favoriteApi = Api.favoritesPublicPlaces;
    // }
    // if (mainCategoryNameArg.contains(ConstantsClass.laFamilleShopName)) {
    //   favoriteApi = Api.favoritesShopping;
    // }
    final response = await http.get(
      Uri.parse(Api.url + _favoriteApi),
      headers: {
        'Content-Type': 'application/json',
        'X-Requested-With': "XMLHttpRequest",
        'Authorization': 'Bearer $token',
      },
    );
    var responseData = json.decode(response.body);
    List<ServiceModel> extractedList = [];

    for (var element in responseData) {
      // Images
      List<ImageModel> extractedImages = [];
      if (element['images'] != null) {
        for (var ele in element['images']) {
          if (element['images'].isNotEmpty) {
            extractedImages.add(
              ImageModel(
                  id: ele['id'],
                  url:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4EipffsrTyo0be-ebYEJ5AMgmNfFthGI-4g&usqp=CAU'
                  // Api.urlWithoutApi + (ele['url'] ?? ''),
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
            final userMap = ele['user'] ?? {};
            extractedComments.add(CommentModel(
              id: ele['id'] ?? 0,
              userID: ele['userId'] ?? 0,
              serviceID: 0,
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
      // Liked List
      List<LikeModel> extractedLikedList = [];
      if (element['likes'] != null) {
        if (element['likes'].isNotEmpty) {
          for (var ele in element['likes']) {
            extractedLikedList.add(
              LikeModel(id: ele['id'], userID: ele['userId']),
            );
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
      extractedList.add(
        ServiceModel(
          mainCategoryName: _mainCategoryName,
          id: element['id'],
          name: element['name'] ?? '',
          description: element['description'] ?? '',
          images: extractedImages,
          categoryID: element['categoryId'] ?? 0,
          favouriteCount: element['favourite_count'] ?? 0,
          liked: (element['like'] ?? 0) == 0 ? false : true,
          likedCount: element['liked_count'] ?? 0,
          likedList: extractedLikedList,
          latitude: (element['latitude'] ?? 0).toDouble(),
          longitude: (element['longitude'] ?? 0).toDouble(),
          haveDiscount: (element['haveDiscount'] ?? 0) == 0 ? false : true,
          avgRating: (element['avgAvis'] ?? 0).toDouble(),
          remise: 0,
          // double.parse(((element['remise'] ?? 0).toString())),
          commentList: extractedComments,
          reviewList: extractedReviews,
          tagList: extractedTags,
        ),
      );
    }
    _list = [];
    _list = extractedList;
    print('responseData');
    print(responseData);
    notifyListeners();
  }

  // FAVORITE API
  void serviceChoiceFct(String mainCategoryNameArg) {
    // var mainCategoryName = '';
    if (mainCategoryNameArg.contains(ConstantsClass.laFamilleGourmandeName)) {
      _favoriteApi = Api.favoritesRestaurants;
      _mainCategoryName = ConstantsClass.laFamilleGourmandeName;
    }
    if (mainCategoryNameArg.contains(ConstantsClass.laFamilleSamuseName)) {
      _favoriteApi = Api.favoritesActivities;
      _mainCategoryName = ConstantsClass.laFamilleSamuseName;
    }
    if (mainCategoryNameArg.contains(ConstantsClass.laFamilleVisiteName)) {
      _favoriteApi = Api.favoritesPublicPlaces;
      _mainCategoryName = ConstantsClass.laFamilleVisiteName;
    }
    if (mainCategoryNameArg.contains(ConstantsClass.laFamilleShopName)) {
      _favoriteApi = Api.favoritesShopping;
      _mainCategoryName = ConstantsClass.laFamilleShopName;
    }
    notifyListeners();
  }

  // Loading function
  void loadingFct(bool isLoading) {
    _loading = isLoading;
    notifyListeners();
  }
}
