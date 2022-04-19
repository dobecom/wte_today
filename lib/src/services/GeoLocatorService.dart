import 'package:geolocator/geolocator.dart';

class GeoLocatorService {
  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    return position;
  }
}
