class PlacesModel {
  final String placeId;
  final String name;
  final double rating;
  final double latitude;
  final double longitude;

  PlacesModel(
      this.placeId, this.name, this.rating, this.latitude, this.longitude);

  // factory PlacesModel.fromJson(Map<String, dynamic> json) {
  //   return PlacesModel(
  //     userId: json['userId'],
  //     id: json['id'],
  //     title: json['title'],
  //     body: json['body'],
  //   );
  // }
}
