import 'package:flutter/material.dart';
import 'package:wte_today/src/components/MainContentComponent.dart';
import 'package:provider/provider.dart';
import 'package:wte_today/src/components/SearchComponent.dart';
import 'package:wte_today/src/providers/LocationProvider.dart';
// import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//kakao dev native app key : c37ec7452f72b9b30857b509f5e1ec51
//kakao dev JS key : 8935ca69c6353ae333cba79e2746eae8
// g maps API : AIzaSyAe7MZEiSHsV1C6pNmrjKmmy2wt815-4JE
// g maps API - android : AIzaSyBYpsFPHeTeW0EWuEChgRm7MfobJyx_Bc0
// app bundle ID : com.example.wteToday

void main() {
  // KakaoSdk.init(nativeAppKey: 'c37ec7452f72b9b30857b509f5e1ec51');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LocationProvider(),
    )
  ], child: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // KakaoMapUtil util = KakaoMapUtil();
    // String url =
    //      util.getMapScreenURL(37.402056, 127.108212, name: 'Kakao 본사');
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          onTap: () => {
            FocusScope.of(context).unfocus(),
          },
          child: ListView(
            children: [
              SearchComponent(),
              MainContentComponent(),
              const Text('주변 식당 목록...'),
              for (var item in context.watch<LocationProvider>().currentPlaces)
                Text(item.name)

              // KakaoMapView(
              //     width: 300,
              //     height: 400,
              //     kakaoMapKey: '8935ca69c6353ae333cba79e2746eae8',
              //     lat: 33.450701,
              //     lng: 126.570667,
              //     showMapTypeControl: true,
              //     showZoomControl: true,
              //     markerImageURL:
              //         'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
              //     onTapMarker: (message) {
              //       //event callback when the marker is tapped
              //     })
            ],
          ),
        ),
      ),
    );
  }
}

// Widget textSection = const Padding(
//   padding: EdgeInsets.all(32),
//   child: Text(
//     'Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior})',
//     softWrap: true,
//   ),
// );

// Widget titleSection = Container(
//   padding: const EdgeInsets.all(32),
//   child: Row(
//     children: [
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: const Text(
//                 'Oeschinen Lake Campground',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Text(
//               'Kandersteg, Switzerland',
//               style: TextStyle(color: Colors.grey[500]),
//             ),
//           ],
//         ),
//       ),
//       const Icon(
//         Icons.star,
//         color: Colors.red,
//       ),
//       const Text('41')
//     ],
//   ),
// );

// Widget startOlympicWidget = Container(
//   padding: const EdgeInsets.all(32),
//   child: Card(
//     child: InkWell(
//         splashColor: Colors.blue.withAlpha(30),
//         onTap: () {
//           Navigator.push(context, )
//         },
//         child: const SizedBox(
//           width: 300,
//           height: 150,
//           child: Text('16강 올림픽 시작'),
//         )),
//   ),
// );

// Color color = Theme.of(context).primaryColor;
//     Widget buttonSection = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildButtonColumn(color, Icons.call, 'CALL'),
//         _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//         _buildButtonColumn(color, Icons.share, 'SHARE'),
//         TextFormField(
//           decoration: const InputDecoration(
//             hintText: 'hi',
//           ),
//         ),
//       ],
//     );

// Column _buildButtonColumn(Color color, IconData icon, String label) {
//   return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//           margin: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ]);


// G Maps Example code
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Google Maps Demo',
//       home: MapSample(),
//     );
//   }
// }

// class MapSample extends StatefulWidget {
//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   Completer<GoogleMapController> _controller = Completer();

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }