import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:wte_today/src/models/PlacesModel.dart';

class LocationProvider with ChangeNotifier {
  // Map data = {'name': 'Sammy Shark', 'email': 'example@example.com', 'age': 42};
  // String? _location;
  // String get location => _location != null ? _location as String : '';
  List<PlacesModel> _currentPlaces = [];
  List<PlacesModel> get currentPlaces => _currentPlaces;
  String _currentLocation = '위치를 설정해주세요';
  String get currentLocation => _currentLocation;

  void updateLocation(input) {
    _currentLocation = input;
    notifyListeners();
  }

  void updateNearbyPlaces(input) {
    _currentPlaces = input;
    notifyListeners();
  }
}
