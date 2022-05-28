import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/PlacesModel.dart';
import '../providers/LocationProvider.dart';
import '../widgets/RestaurantPreviewWidget.dart';
import 'package:wte_today/src/services/GglService.dart';

class SelectRestaurantScreen extends StatelessWidget {
  const SelectRestaurantScreen({Key? key}) : super(key: key);
  final String url1 =
      'https://postfiles.pstatic.net/MjAyMDAyMDFfMTU1/MDAxNTgwNTQzNTI3OTAz.XysiyRFf8pbVMvqoowWELBaoqRSmCIEet9AFc8rrFPog.uc4-vF47bJfIMLK9nUGJ1gQFJuxPXdq4nkiqp-uGVmog.JPEG.risingkeyword/IMG_3930.JPG?type=w966';
  final String url2 =
      'https://postfiles.pstatic.net/MjAyMTEwMjBfOTUg/MDAxNjM0NzM3MzgxMjcw.PKhZZ72elrrKGcleogvrj5qxfLUu7OLLQ70wLaVRIjwg.ZzHELGBvJR6O1c4BlGo_d2xP5JEH3BnuvKB5f9f5EOAg.JPEG.joohj9404/output_2706785171.jpg?type=w773';
  @override
  Widget build(BuildContext context) {
    List<PlacesModel> currentPlaces =
        context.watch<LocationProvider>().currentPlaces;
    GglService.getFullUrl('400', currentPlaces[0].photos[0].photoReference);

    return Scaffold(
      body: Column(children: [
        Text('주변 식당 수 : ' + currentPlaces.length.toString()),
        RestaurantPreviewWidget(
          imageUrl: GglService.getFullUrl(
              '400', currentPlaces[0].photos[0].photoReference),
          restaurantName: currentPlaces[0].name,
          ratings: currentPlaces[0].rating,
        ),
        const Divider(),
        RestaurantPreviewWidget(
          imageUrl: GglService.getFullUrl(
              '400', currentPlaces[1].photos[0].photoReference),
          restaurantName: currentPlaces[1].name,
          ratings: currentPlaces[1].rating,
        ),
        // RestaurantPreviewWidget(
        //   imageUrl: url1,
        //   restaurantName: '옛날 농장',
        //   ratings: 3,
        // ),
        // const Divider(),
        // RestaurantPreviewWidget(
        //   imageUrl: url2,
        //   restaurantName: '로얄 돈가스',
        //   ratings: 4.5,
        // ),
      ]),
    );
  }
}
