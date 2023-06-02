import 'comment_model.dart';
import 'image_model.dart';
import 'review_model.dart';
import 'tag.dart';

class ServiceModel {
  int id, categoryID, favouriteCount, likedCount;
  String mainCategoryName, name, description;
  bool haveDiscount, liked;
  double avgRating, latitude, longitude, remise;
  List<ImageModel> images;
  List<CommentModel> commentList;
  List<ReviewModel> reviewList;
  List<TagModel> tagList;
  ServiceModel({
    required this.mainCategoryName,
    required this.id,
    required this.name,
    required this.description,
    required this.categoryID,
    required this.avgRating,
    required this.favouriteCount,
    required this.haveDiscount,
    required this.images,
    required this.latitude,
    required this.liked,
    required this.likedCount,
    required this.longitude,
    required this.commentList,
    required this.reviewList,
    required this.tagList,
    required this.remise,
  });
}
