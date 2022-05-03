import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:wte_today/src/models/PlacesModel.dart';
import 'package:google_maps_webservice/places.dart' as web_gmaps;

import '../providers/LocationProvider.dart';
import 'SetLocationComponent.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  // final searchController = TextEditingController();
  String inputText = '';
  static String googlePlacesAPIKey = 'AIzaSyB2EQRPjxCCuvlI6lXLp8yrvwurDmejgV4';
  final web_gmaps.GoogleMapsPlaces _places =
      web_gmaps.GoogleMapsPlaces(apiKey: googlePlacesAPIKey);
  List<web_gmaps.PlacesSearchResult> places = [];
  late GoogleMapController _controller;
  final Location _location = Location();
  late List<PlacesModel> restaurants;
  LatLng? latLng;

  getNearbyPlaces() {
    // _controller = ctlr;
    _location.getLocation().then((value) async {
      latLng = LatLng(value.latitude!, value.longitude!);
      // _controller.animateCamera(
      //   CameraUpdate.newCameraPosition(
      //     CameraPosition(target: latLng, zoom: 15),
      //   ),
      // );
      final location =
          web_gmaps.Location(lat: latLng!.latitude, lng: latLng!.longitude);
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
                result.geometry!.location.lng);
            restaurantList.add(restaurant);
          }
        }
        setState(() {
          restaurants = restaurantList;
        });
      }).catchError((onError) {
        print('error1');
      });
    }).catchError((onError) {
      print('error2');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(children: [
        // Expanded(
        //   child: TextField(
        //       decoration: const InputDecoration(
        //         hintText: '위치를 설정하세요',
        //         // labelText: context.read<LocationProvider>().location.toString(),
        //       ),
        //       keyboardType: TextInputType.text,
        //       onChanged: (text) {
        //         setState(() {
        //           inputText = text;
        //         });
        //       },
        //       // controller: searchController,
        //       // textInputAction: TextInputAction.go,
        //       onSubmitted: (value) {
        //         if (inputText != '') {
        //           // context.read<LocationProvider>().updateData(inputText);
        //           // Provider.of<LocationProvider>(context, listen: false)
        //           //     .updateData(value);
        //         } else {}
        //       }),
        // ),
        const Text('현재 위치 설정하기'),
        IconButton(
            onPressed: getNearbyPlaces,
            // () {
            //   if (inputText != '') {
            //     // context.read<LocationProvider>().updateData(inputText);
            //     // Provider.of<LocationProvider>(context, listen: false)
            //     //     .updateData(searchController.text);
            //   } else {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) {
            //       return const SetLocationComponent();
            //     }));
            //   }
            // },
            icon: const Icon(Icons.search))
      ]),
    );
  }
}
