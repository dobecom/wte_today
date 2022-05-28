import 'package:flutter/material.dart';

class RestaurantPreviewWidget extends StatelessWidget {
  const RestaurantPreviewWidget(
      {Key? key,
      required this.imageUrl,
      required this.restaurantName,
      required this.ratings,
      required this.distance})
      : super(key: key);
  final String imageUrl;
  final String restaurantName;
  final double ratings;
  final String distance;

  _getStarArray(ratings) {
    final int length = ratings.round();
    //반올림 해서 값이 더 크면, 0.5 star로 표시
    bool halfPoint = length > ratings ? true : false;
    return Row(
        children: List.generate(
            length,
            (index) => !(halfPoint && (index == length - 1))
                ? const Icon(
                    Icons.star,
                    color: Colors.red,
                  )
                : const Icon(Icons.star_half, color: Colors.red)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: 300,
              height: 200,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  restaurantName,
                  style: TextStyle(
                      backgroundColor: Colors.grey[50],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: 300,
              height: 200,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(children: [
                    Text(
                      ratings.toString(),
                      style: TextStyle(
                          backgroundColor: Colors.grey[50],
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    _getStarArray(ratings)
                  ])),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: 300,
              height: 200,
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  distance.toString(),
                  style: TextStyle(
                      backgroundColor: Colors.grey[50],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
