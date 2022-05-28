import 'PhotoRefModel.dart';

class PlacesModel {
  final String placeId;
  final String name;
  final double rating;
  final double latitude;
  final double longitude;
  final String distance;
  final List<PhotoRefModel> photos;

  PlacesModel(this.placeId, this.name, this.rating, this.latitude,
      this.longitude, this.distance, this.photos);
}
