import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:geolocator/geolocator.dart';
// import '../services/GeoLocatorService.dart';
// import 'com.google.android.libraries.places.api';

class SetLocationComponent extends StatefulWidget {
  const SetLocationComponent({Key? key}) : super(key: key);

  @override
  State<SetLocationComponent> createState() => _SetLocationComponentState();
}

class _SetLocationComponentState extends State<SetLocationComponent> {
  Completer<GoogleMapController> _controller = Completer();

  // Location location = new Location();
  // bool _serviceEnabled = false;
  // late PermissionStatus _permissionGranted;
  // LocationData? _locationData;
  // getCurrentLocation() async {
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   _locationData = await location.getLocation();
  //   print(_locationData);
  // }

  Future<Position> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  CameraPosition _initLocation =
      CameraPosition(target: LatLng(37.4219983, -122.084), zoom: 14.4746);

  // double centerLng = 43;
  // double centerLat = 21;
  // bool loading = false;

  // void initState() {
  //   super.initState();
  //   loading = true;
  //   getPosition();
  // }

  // getPosition() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.best);
  //   try {
  //     setState(() {
  //       centerLng = position.longitude;
  //       centerLat = position.latitude;
  //       loading = false;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: TextButton(
    //     child: const Text('hi'),
    //     onPressed: () {
    //       getCurrentLocation();
    //       // print('location data is...');
    //       // print(_locationData);
    //     },
    //   ),
    // );

    late Position pos;
    getCurrentLocation().then((value) {
      pos = value;
      setState(() {
        _initLocation = CameraPosition(
            target: LatLng(pos.latitude, pos.longitude), zoom: 14.4746);
      });
    });

    return Scaffold(
      body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _initLocation,
          onMapCreated: (GoogleMapController controlller) {
            _controller.complete(controlller);
          }),
    );
  }
}
