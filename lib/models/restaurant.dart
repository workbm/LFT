import 'package:lft_new_project/models/image_model.dart';

class Restaurant {
  int id;
  String name;
  String description;
  List<ImageModel> images;
  String remise;
  int categoryId;
  double longitude;
  double latitude;
  String code;

  int likedCount;
  int favouriteCount;
  int like;
  num avgAvis;
  // Category? category;

  // List<Avis>? avis;
  // List<Likes>? likes;
  // List<Comments>? comments;
  // List<Tags>? tags;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    this.remise = '',
    this.categoryId = 0,
    this.longitude = 0,
    this.latitude = 0,
    this.code = '',
    this.likedCount = 0,
    this.favouriteCount = 0,
    this.like = 0,
    this.avgAvis = 0,
    // this.category,
    // this.avis,
    // this.likes,
    // this.comments,
    // this.tags,
  });
}
