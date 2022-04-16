import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SetLocationComponent extends StatefulWidget {
  const SetLocationComponent({Key? key}) : super(key: key);

  @override
  State<SetLocationComponent> createState() => _SetLocationComponentState();
}

class _SetLocationComponentState extends State<SetLocationComponent> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _initLocation = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);

  @override
  Widget build(BuildContext context) {
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
