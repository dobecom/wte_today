import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/LocationProvider.dart';
import 'RestaurantPreviewComponent.dart';

class SelectRestaurantComponent extends StatelessWidget {
  const SelectRestaurantComponent({Key? key}) : super(key: key);
  final String url1 =
      'https://postfiles.pstatic.net/MjAyMDAyMDFfMTU1/MDAxNTgwNTQzNTI3OTAz.XysiyRFf8pbVMvqoowWELBaoqRSmCIEet9AFc8rrFPog.uc4-vF47bJfIMLK9nUGJ1gQFJuxPXdq4nkiqp-uGVmog.JPEG.risingkeyword/IMG_3930.JPG?type=w966';
  final String url2 =
      'https://postfiles.pstatic.net/MjAyMTEwMjBfOTUg/MDAxNjM0NzM3MzgxMjcw.PKhZZ72elrrKGcleogvrj5qxfLUu7OLLQ70wLaVRIjwg.ZzHELGBvJR6O1c4BlGo_d2xP5JEH3BnuvKB5f9f5EOAg.JPEG.joohj9404/output_2706785171.jpg?type=w773';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        RestaurantPreviewComponent(
          imageUrl: url1,
        ),
        const Divider(),
        RestaurantPreviewComponent(
          imageUrl: url2,
        ),
      ]),
    );
  }
}
