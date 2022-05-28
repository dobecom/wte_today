import 'package:flutter/material.dart';
import 'package:wte_today/src/widgets/ContentCardWidget.dart';

class MainContentScreen extends StatelessWidget {
  const MainContentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ContentCardWidget(
          contentName: '16강 올림픽 시작',
        ),
        Divider(),
        ContentCardWidget(
          contentName: '즐겨찾는 식당 등록',
        ),
      ],
    );
  }
}
