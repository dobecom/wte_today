import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/LocationProvider.dart';
import 'StartingOptionComponent.dart';

class ContentCardComponent extends StatelessWidget {
  const ContentCardComponent({Key? key, required this.contentName})
      : super(key: key);
  final String contentName;
  @override
  Widget build(BuildContext context) {
    // String location = context.watch<LocationProvider>().location.toString();
    String location = context.watch<LocationProvider>().currentLocation;
    return Container(
      padding: const EdgeInsets.all(32),
      child: Card(
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              if (location == '') {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Warning'),
                        content: const Text('위치를 먼저 설정해주세요'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'))
                        ],
                      );
                    });
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StartingOptionComponent();
                }));
              }
            },
            child: SizedBox(
              width: 300,
              height: 150,
              child: Text(contentName),
            )),
      ),
    );
  }
}
