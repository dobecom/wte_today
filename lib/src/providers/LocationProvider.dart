import 'package:flutter/material.dart';

class LocationProvider with ChangeNotifier {
  // Map data = {'name': 'Sammy Shark', 'email': 'example@example.com', 'age': 42};
  String? _location;
  String get location => _location != null ? _location as String : '';
  void updateData(input) {
    _location = input;
    notifyListeners();
  }
}
