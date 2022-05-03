import 'package:flutter/material.dart';
import 'package:wte_today/src/models/PlacesModel.dart';

class LocationProvider with ChangeNotifier {
  // Map data = {'name': 'Sammy Shark', 'email': 'example@example.com', 'age': 42};
  // String? _location;
  // String get location => _location != null ? _location as String : '';
  late List<PlacesModel> _pm;
  List<PlacesModel> get pm => _pm;

  // void updateLocation(input) {
  //   _location = input;
  //   notifyListeners();
  // }

  void updateNearbyPlaces(input) {
    _pm = input;
    notifyListeners();
  }
}
