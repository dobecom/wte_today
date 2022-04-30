import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../models/PlacesModel.dart';

class NearbySearchService {
  // var testUri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  var testUri =
      Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json');
  final Position location;
  final String keyword;
  final int radius;
  final String type;
  final String API_KEY;
  NearbySearchService(
      this.location, this.keyword, this.radius, this.type, this.API_KEY);

  Future<PlacesModel> fetchPost() async {
    final response = await http.post(testUri);
    if (response.statusCode == 200) {
      // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
      return PlacesModel.fromJson(json.decode(response.body));
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }
}
