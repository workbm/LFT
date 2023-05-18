class ReviewModel {
  int id, userID, serviceID;
  double rating;
  DateTime time;
  ReviewModel(
      {required this.id,
      required this.userID,
      required this.serviceID,
      required this.rating,
      required this.time});
}
