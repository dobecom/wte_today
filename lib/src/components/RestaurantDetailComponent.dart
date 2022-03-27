import 'package:flutter/material.dart';
import '../models/Restaurants.dart';

class RestaurantDetail extends StatelessWidget {
  final Restaurant? restaurant = null;
  // final String title;
  const RestaurantDetail(restaurant, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(restaurant.name),
        const Text('외않되')
      ],
    );
  }
}
