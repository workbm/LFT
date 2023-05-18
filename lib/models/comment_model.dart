import 'package:lft_new_project/models/review_model.dart';

class CommentModel {
  int id, userID, serviceID;
  double rating;
  DateTime time;
  ReviewModel review;
  CommentModel({
    required this.id,
    required this.userID,
    required this.serviceID,
    required this.rating,
    required this.time,
    required this.review,
  });
}
