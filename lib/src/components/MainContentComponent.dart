import 'package:flutter/material.dart';
import 'package:wte_today/src/components/ContentCardComponent.dart';

class MainContentComponent extends StatelessWidget {
  const MainContentComponent({Key? key, this.location}) : super(key: key);
  final String? location;
  @override
  Widget build(BuildContext context) {
    print(location);
    return Column(
      children: [
        ContentCardComponent(
          contentName: '16강 올림픽 시작',
          location: location,
        ),
        const Divider(),
        ContentCardComponent(
          contentName: '즐겨찾는 식당 등록',
          location: location,
        ),
      ],
    );
  }
}
