import 'package:flutter/material.dart';

class RestaurantPreviewComponent extends StatelessWidget {
  const RestaurantPreviewComponent({Key? key, required this.imageUrl})
      : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: Card(
          child: Image.network(
            //'https://postfiles.pstatic.net/MjAyMDAyMDFfMTU1/MDAxNTgwNTQzNTI3OTAz.XysiyRFf8pbVMvqoowWELBaoqRSmCIEet9AFc8rrFPog.uc4-vF47bJfIMLK9nUGJ1gQFJuxPXdq4nkiqp-uGVmog.JPEG.risingkeyword/IMG_3930.JPG?type=w966',
            imageUrl,
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
