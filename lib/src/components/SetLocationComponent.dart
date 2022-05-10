import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:wte_today/src/models/PhotoRefModel.dart';
import 'package:wte_today/src/models/PlacesModel.dart';
import 'package:google_maps_webservice/places.dart' as web_gmaps;

class SetLocationComponent extends StatefulWidget {
  const SetLocationComponent({Key? key}) : super(key: key);

  @override
  State<SetLocationComponent> createState() => _SetLocationComponentState();
}

class _SetLocationComponentState extends State<SetLocationComponent> {
  final CameraPosition _initLocation =
      const CameraPosition(target: LatLng(37.2419983, -122.084), zoom: 12.4746);

  static String googlePlacesAPIKey = 'AIzaSyB2EQRPjxCCuvlI6lXLp8yrvwurDmejgV4';
  final web_gmaps.GoogleMapsPlaces _places =
      web_gmaps.GoogleMapsPlaces(apiKey: googlePlacesAPIKey);
  List<web_gmaps.PlacesSearchResult> places = [];
  // late GoogleMapController mapController;
  late GoogleMapController _controller;
  final Location _location = Location();
  late List<PlacesModel> restaurants;

  void _onMapCreated(GoogleMapController ctlr) {
    LatLng latLng;
    _controller = ctlr;
    _location.getLocation().then((value) {
      latLng = LatLng(value.latitude!, value.longitude!);
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 15),
        ),
      );
      getNearbyPlaces(latLng);
    });
    //실시간 위치 업데이트
    // _location.onLocationChanged.listen((l) {
    //   _controller.animateCamera(
    //     CameraUpdate.newCameraPosition(
    //       CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
    //     ),
    //   );
    // });
  }

  void getNearbyPlaces(LatLng latLng) async {
    final location =
        web_gmaps.Location(lat: latLng.latitude, lng: latLng.longitude);
    PlacesModel restaurant;
    List<PlacesModel> restaurantList = <PlacesModel>[];
    final result =
        await _places.searchNearbyWithRadius(location, 2500).then((value) {
      for (web_gmaps.PlacesSearchResult result in value.results) {
        if (result.types.contains('restaurant')) {
          restaurant = PlacesModel(
              result.placeId,
              result.name,
              result.rating as double,
              result.geometry!.location.lat,
              result.geometry!.location.lng,
              result.photos as List<PhotoRefModel>);
          restaurantList.add(restaurant);
        }
      }
      setState(() {
        restaurants = restaurantList;
      });
    });
    // setState(() {
    //   if (result.status == "OK") {
    //     places = result.results;
    //   }
    //   print(result.status);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
            padding: const EdgeInsets.all(5),
            width: 500,
            height: 500,
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _initLocation,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            )),
        // restaurants.forEach((element) {
        //   return const Text('hi');
        // }),
      ]),
    );
  }
}
