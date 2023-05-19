import 'package:lft_new_project/models/review_model.dart';
import 'package:lft_new_project/models/user_model.dart';

class CommentModel {
  int id, userID, serviceID;
  double rating;
  DateTime time;
  ReviewModel review;
  UserModel user;
  CommentModel({
    required this.id,
    required this.userID,
    required this.serviceID,
    required this.rating,
    required this.time,
    required this.review,
    required this.user,
  });
}
