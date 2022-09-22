import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/PlacesModel.dart';
import '../providers/LocationProvider.dart';
import '../widgets/RestaurantPreviewWidget.dart';
import 'package:wte_today/src/services/GglService.dart';

class SelectRestaurantScreen extends StatefulWidget {
  const SelectRestaurantScreen({Key? key}) : super(key: key);

  @override
  State<SelectRestaurantScreen> createState() => _SelectRestaurantScreenState();
}

class _SelectRestaurantScreenState extends State<SelectRestaurantScreen> {
  // final String url1 =
  List<PlacesModel> selectedCurrentPlaces = [];

  @override
  Widget build(BuildContext context) {
    List<PlacesModel> currentPlaces =
        context.watch<LocationProvider>().currentPlaces;
    // GglService.getFullUrl('400', currentPlaces[0].photos[0].photoReference);
    int count = 0;

    return Scaffold(
      body: Column(children: [
        Text('주변 식당 수 : ' + currentPlaces.length.toString()),
        GestureDetector(
          child: RestaurantPreviewWidget(
            imageUrl: GglService.getFullUrl(
                '400',
                (currentPlaces[count].photos != null &&
                        currentPlaces[count].photos.length > 0)
                    ? currentPlaces[count].photos[0].photoReference
                    : '' //Image(image: AssetImage('lib/images/noImageFound.png'))
                // currentPlaces[0].photos[0].photoReference,
                ),
            restaurantName: currentPlaces[count].name,
            ratings: currentPlaces[count].rating,
            distance: currentPlaces[count].distance,
          ),
          onTap: () {
            print('click first');
            // currentPlaces.removeAt(2);
            setState(() {
              PlacesModel retVal = currentPlaces.removeAt(count);
              selectedCurrentPlaces.add(retVal);
              currentPlaces.removeAt(count + 1);
              count = count + 2;
            });
          },
        ),

        const Divider(),
        GestureDetector(
          child: RestaurantPreviewWidget(
            imageUrl: GglService.getFullUrl(
                '400',
                (currentPlaces[count + 1].photos != null &&
                        currentPlaces[count + 1].photos.length > 0)
                    ? currentPlaces[count + 1].photos[0].photoReference
                    : '' //Image(image: AssetImage('lib/images/noImageFound.png'))
                // currentPlaces[1].photos[0].photoReference
                ),
            restaurantName: currentPlaces[count + 1].name,
            ratings: currentPlaces[count + 1].rating,
            distance: currentPlaces[count + 1].distance,
          ),
          onTap: () {
            print('click second');
            setState(() {
              PlacesModel retVal = currentPlaces.removeAt(count + 1);
              selectedCurrentPlaces.add(retVal);
              currentPlaces.removeAt(count);
              count = count + 2;
            });
          },
        ),
        for (var restaurant in selectedCurrentPlaces) Text(restaurant.name)

        // selectedCurrentPlaces.length > 0
        //     ?
        // Text(selectedCurrentPlaces[0].name)

        // _getSelectedRestaurants()
        //  (...selectedCurrentPlaces.map((e) => Text(e.name)).toList())
        // selectedCurrentPlaces.map((e) => Text(e.name)).toList()
        // : Container(child: Text('')),
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

// List<Widget> widgets = selectedCurrentPlaces.map((e) => Text(e.name)).toList();

//   _getSelectedRestaurants() {
//     return selectedCurrentPlaces.map((e) => {return Text(e.name)}).toList();
//   }
}
