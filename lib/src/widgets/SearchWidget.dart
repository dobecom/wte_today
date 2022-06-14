import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:wte_today/src/models/PhotoRefModel.dart';
import 'package:wte_today/src/models/PlacesModel.dart';
import 'package:google_maps_webservice/places.dart' as web_gmaps;
import 'package:wte_today/src/services/GglService.dart';
import 'package:wte_today/src/utils/Config.dart';
import 'package:wte_today/src/utils/SecurityKeys.dart';
import '../providers/LocationProvider.dart';
import 'package:geocoding/geocoding.dart' as geo;

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  // static String googlePlacesAPIKey = 'AIzaSyB2EQRPjxCCuvlI6lXLp8yrvwurDmejgV4';
  final web_gmaps.GoogleMapsPlaces _places =
      web_gmaps.GoogleMapsPlaces(apiKey: SecurityKeys.gMapsAPIKey);
  List<web_gmaps.PlacesSearchResult> places = [];
  late GoogleMapController _controller;
  final Location _location = Location();
  late PlacesModel restaurant;
  List<PlacesModel> restaurants = [];

  List<PlacesModel> restaurantList = <PlacesModel>[];
  LatLng? latLng;

  getNearbyPlaces() {
    _location.getLocation().then(setCurrentLocation, onError: (e) {
      handleError(e);
    }).catchError(handleError);
  }

  FutureOr setCurrentLocation(LocationData value) async {
    // latLng = LatLng(value.latitude!, value.longitude!);
    latLng = LatLng(37.5643, 127.0058);

    // _controller.animateCamera(
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(target: latLng, zoom: 15),
    //   ),
    // );
    final location =
        web_gmaps.Location(lat: latLng!.latitude, lng: latLng!.longitude);
    // context.read<LocationProvider>().updateLocation(location);
    // Provider.of<LocationProvider>(context, listen: false)
    // .updateLocation(location);

    List<geo.Placemark> placemark =
        await geo.placemarkFromCoordinates(location.lat, location.lng);
    final String currentLocationStreetName =
        '현재 위치 : ' + placemark[0].street.toString();
    context.read<LocationProvider>().updateLocation(currentLocationStreetName);
    final result = await _places
        .searchNearbyWithRadius(location, Config.currentPlacesRange,
            type: "restaurant")
        .then(setNearbyPlaces, onError: (e) {
      handleError(e);
    }).catchError(handleError);

    // final result = await _places
    //     .searchNearbyWithRankBy(location, "distance", type: "restaurant")
    //     .then(setNearbyPlaces, onError: (e) {
    //   handleError(e);
    // }).catchError(handleError);

    // final result = await _places
    //     .searchNearbyWithRadius(location, Config.currentPlacesRange)
    //     .then(setNearbyPlaces, onError: (e) {
    //   handleError(e);
    // }).catchError(handleError);
  }

  FutureOr setNearbyPlaces(web_gmaps.PlacesSearchResponse value) {
    for (web_gmaps.PlacesSearchResult result in value.results) {
      List<PhotoRefModel> photos = [];
      // if (result.types.contains('restaurant')) {
      if (result.photos.length > 0) {
        for (var photo in result.photos) {
          photos.add(
              PhotoRefModel(photo.height, photo.width, photo.photoReference));
        }
      } else {
        // photos.add(PhotoRefModel(10, 10,
        //     'Aap_uEB-56jWo756ww9JDijDREeVlTBUJn1xGoNF7fnP0jlx8oxO4xLcCage2gVy3FxmA8YxOsmbN5i0w0sQ5NFUHiq9OlpyBLbCl_YI02W-5kDKE1ozjVnBSASGYTojOkyamh7M3Z_N8IFD2wDJZgO9D2_v2e6wDIkLu9CeF_5aglSeHRpD'));
      }

      restaurant = PlacesModel(
          result.placeId,
          result.name,
          result.rating != null ? result.rating!.toDouble() : 0.0,
          result.geometry!.location.lat,
          result.geometry!.location.lng,
          GglService.calculateDistance(latLng!.latitude, latLng!.longitude,
              result.geometry!.location.lat, result.geometry!.location.lng),
          photos);
      restaurantList.add(restaurant);
    }
    // }
    context.read<LocationProvider>().updateNearbyPlaces(restaurantList);

    // setState(() {
    //   restaurants = restaurantList;
    // });
  }

  void handleError(e) {
    print(e.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        Text(context.watch<LocationProvider>().currentLocation),
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
