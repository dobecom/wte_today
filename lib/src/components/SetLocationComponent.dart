import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../services/GeoLocatorService.dart';

class SetLocationComponent extends StatefulWidget {
  const SetLocationComponent({Key? key}) : super(key: key);

  @override
  State<SetLocationComponent> createState() => _SetLocationComponentState();
}

class _SetLocationComponentState extends State<SetLocationComponent> {
  Completer<GoogleMapController> _controller = Completer();
  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  getCurrentLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  static final CameraPosition _initLocation = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);

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
    return Scaffold(
      body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
              target: LatLng(getCurrentLocation()._locationData.latitude,
                  getCurrentLocation()._locationData.longitude)),
          onMapCreated: (GoogleMapController controlller) {
            _controller.complete(controlller);
          }),
    );
  }
}
