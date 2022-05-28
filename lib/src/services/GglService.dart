import 'dart:math';

import 'package:wte_today/src/utils/SecurityKeys.dart';

class GglService {
  static String getFullUrl(maxWidth, photoRef) {
    String gMapsPhotoUrl = 'https://maps.googleapis.com/maps/api/place/photo';
    return gMapsPhotoUrl +
        '?maxwidth=' +
        maxWidth +
        '&photo_reference=' +
        photoRef +
        '&key=' +
        SecurityKeys.gMapsAPIKey;
  }

  static String calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    double result = 12742 * asin(sqrt(a));
    String distance = '';
    if (result < 1) {
      distance = (result * 100).floor().toString() + 'm';
    } else {
      distance = result.toStringAsFixed(2);
    }

    return distance;
  }
}
