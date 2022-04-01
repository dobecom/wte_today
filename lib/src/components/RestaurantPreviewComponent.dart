import 'package:flutter/material.dart';

class RestaurantPreviewComponent extends StatelessWidget {
  const RestaurantPreviewComponent({Key? key, required this.imageUrl})
      : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Image.network(
          imageUrl,
          width: 300,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
