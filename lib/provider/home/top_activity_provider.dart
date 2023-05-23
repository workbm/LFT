import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/api.dart';
import 'package:lft_new_project/models/comment_model.dart';
import 'package:lft_new_project/models/review_model.dart';
import 'package:lft_new_project/models/service_model.dart';
import 'package:lft_new_project/models/tag.dart';
import 'package:lft_new_project/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/image_model.dart';

class TopActivityProvider with ChangeNotifier {
  List<ServiceModel> _activities = [];
  List<ServiceModel> get activities => _activities;
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
      List<ServiceModel> extractedActivities = [];
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
        // ActivityModels
        extractedActivities.add(
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
      _activities = [];
      _activities = extractedActivities;
      print('responseData Activities');
      print(responseData);
      notifyListeners();
    } catch (err) {
      print('err');
      print(err);
      rethrow;
    }
  }
}
