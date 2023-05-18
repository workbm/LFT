import 'package:lft_new_project/models/image_model.dart';

class ActivityModel {
  int id, categoryID, favouriteCount, haveDiscount, likedCount;
  String name, description;
  double avgRating, latitude, longitude;
  List<ImageModel> images;
  ActivityModel({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryID,
    required this.avgRating,
    required this.favouriteCount,
    this.haveDiscount = 0,
    required this.images,
    required this.latitude,
    required this.likedCount,
    required this.longitude,
  });
}
