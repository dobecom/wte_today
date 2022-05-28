import 'package:wte_today/src/utils/Env.dart';

class GglService {
  static String getFullUrl(maxWidth, photoRef) {
    String gMapsPhotoUrl = 'https://maps.googleapis.com/maps/api/place/photo';
    return gMapsPhotoUrl +
        '?maxwidth=' +
        maxWidth +
        '&photo_reference=' +
        photoRef +
        '&key=' +
        Env.gMapsAPIKey;
  }
}
