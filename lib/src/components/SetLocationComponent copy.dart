import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wte_today/src/models/PlacesModel.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

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
  bool isCheckedCurrentLocation = false;

  // late LocationPermission permission;
  // late Position position;

  @override
  void initState() {
    super.initState();
    // initState 에서는 Future를 리턴할 수 없음.(async, await를 쓸 수 없음)
    // 동기처리해야하는 이유는 구글맵 뿌리기 전에 현재 위치부터 가져와야하기 때문임
    // await getLocation();
  }

//  await getCurrentLocation().then((value) {
//       Position pos = value;
//       if (!isCheckedCurrentLocation) {
//         setState(() {
//           _initLocation = CameraPosition(
//               target: LatLng(pos.latitude, pos.longitude), zoom: 18);
//           isCheckedCurrentLocation = true;
//           locValue = _initLocation.toString();
//           position = value;
//         });
//       }
//       locValue = pos.latitude.toString();
//     });

  // Future<Position> getCurrentLocation() async {
  //   permission = await Geolocator.requestPermission();

  //   position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   return position;
  // }

  Future<String> printString() async {
    return 'hi';
  }

  CameraPosition _initLocation =
      const CameraPosition(target: LatLng(37.2419983, -122.084), zoom: 12.4746);

  final Completer<GoogleMapController> _controller = Completer();

  // late Future<PlacesModel> placesModel;
  // @override
  // void initState() {
  //   super.initState();
  //   // placesModel = NearbySearchService(position, '', 1000, 'restaurant',
  //   //         'AIzaSyBYpsFPHeTeW0EWuEChgRm7MfobJyx_Bc0')
  //   //     .fetchPost();
  // }

  static String kGoogleApiKey = 'AIzaSyBYpsFPHeTeW0EWuEChgRm7MfobJyx_Bc0';
  final GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
  List<PlacesSearchResult> places = [];
  // late GoogleMapController mapController;

  // void _onMapCreated(Position currentPosition) {
  //   // mapController = controller;
  //   getNearbyPlaces(
  //       LatLng(currentPosition.latitude, currentPosition.longitude));
  // }

  // void getNearbyPlaces(LatLng center) async {
  //   final location = Location(lat: position.latitude, lng: position.longitude);
  //   final result = await _places.searchNearbyWithRadius(location, 2500);

  //   setState(() {
  //     if (result.status == "OK") {
  //       places = result.results;
  //     }
  //     print(result.status);
  //   });
  // }

  // CameraPosition _initLocation =
  //     CameraPosition(target: LatLng(37.4219983, -122.084), zoom: 14.4746);
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<Position>(
    //     future: getCurrentLocation(),
    //     builder: ((context, AsyncSnapshot<Position> snapshot) {
    //       List<Widget> children;
    //       if (snapshot.hasData) {
    //         children = <Widget>[
    //           Container(
    //             child: const Text('hi'),
    //           ),
    //           // Container(
    //           //   padding: const EdgeInsets.all(5),
    //           //   width: 500,
    //           //   height: 500,
    //           //   child: GoogleMap(
    //           //       mapType: MapType.hybrid,
    //           //       initialCameraPosition: _initLocation,
    //           //       // CameraPosition(
    //           //       //     target: LatLng(
    //           //       //         snapshot.data!.latitude, snapshot.data!.longitude),
    //           //       //     zoom: 14.4746),
    //           //       onMapCreated: (GoogleMapController controlller) {
    //           //         _controller.complete(controlller);
    //           //       }),
    //           // )
    //         ];
    //       } else if (snapshot.hasError) {
    //         children = <Widget>[
    //           const Icon(
    //             Icons.error_outline,
    //             color: Colors.red,
    //             size: 60,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(top: 16),
    //             child: Text('Error: ${snapshot.error}'),
    //           )
    //         ];
    //       } else {
    //         children = const <Widget>[
    //           SizedBox(
    //             width: 60,
    //             height: 60,
    //             child: CircularProgressIndicator(),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(top: 16),
    //             child: Text('Awaiting result...'),
    //           )
    //         ];
    //       }
    //       return Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: children,
    //         ),
    //       );
    //     }));
    //왜 퓨처 then이 안먹지?
    printString().then((value) {
      print('hi');
    }).catchError((e) {
      print(e);
    });

    // getCurrentLocation().then((value) {
    //   print('why didn' 't proceed this section?');
    //   _onMapCreated(value);
    //   setState(() {
    //     _initLocation = CameraPosition(
    //         target: LatLng(value.latitude, value.longitude), zoom: 10.4746);
    //   });
    //   print(position);
    // }).catchError((err) {
    //   print(err);
    // });
    return Scaffold(
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.all(5),
          width: 500,
          height: 500,
          child: GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _initLocation,
            // onMapCreated: (GoogleMapController controlller) {
            //   // _onMapCreated(controlller);
            //   // _controller.complete(controlller);
            // }
          ),
        )
      ]),
    );

    // FutureBuilder<PlacesModel>(
    //   future: placesModel,
    //   builder: (context, snapshot) {
    //     String tempText = (snapshot.data?.title ?? '');
    //     if (snapshot.hasData) {
    //       return Text(tempText);
    //     } else if (snapshot.hasError) {
    //       return Text("${snapshot.error}");
    //     }
    //     // 기본적으로 로딩 Spinner를 보여줍니다.
    //     return CircularProgressIndicator();
    //   },
    // )
  }
}
