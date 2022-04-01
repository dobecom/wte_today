import 'package:flutter/material.dart';
import 'package:wte_today/src/components/ContentCardComponent.dart';

class MainContentComponent extends StatelessWidget {
  const MainContentComponent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ContentCardComponent(
          contentName: '16강 올림픽 시작',
          // location: Provider.of<Data>(context, listen: false).location,
        ),
        Divider(),
        ContentCardComponent(
          contentName: '즐겨찾는 식당 등록',
          // location: location,
        ),
      ],
    );
  }
}
