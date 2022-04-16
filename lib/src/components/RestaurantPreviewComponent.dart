import 'package:flutter/material.dart';

class RestaurantPreviewComponent extends StatelessWidget {
  const RestaurantPreviewComponent(
      {Key? key,
      required this.imageUrl,
      required this.restaurantName,
      required this.popularPoint})
      : super(key: key);
  final String imageUrl;
  final String restaurantName;
  final double popularPoint;

  _getStarArray(popularPoint) {
    final int length = popularPoint.round();
    //반올림 해서 값이 더 크면, 0.5 star로 표시
    bool halfPoint = length > popularPoint ? true : false;
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
                      popularPoint.toString(),
                      style: TextStyle(
                          backgroundColor: Colors.grey[50],
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    _getStarArray(popularPoint)
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
