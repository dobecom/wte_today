class PlacesModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PlacesModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory PlacesModel.fromJson(Map<String, dynamic> json) {
    return PlacesModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
