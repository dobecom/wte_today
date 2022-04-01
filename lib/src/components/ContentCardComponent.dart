import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wte_today/src/components/SearchComponent.dart';
import '../providers/LocationProvider.dart';
import 'StartingOptionComponent.dart';

class ContentCardComponent extends StatelessWidget {
  const ContentCardComponent({Key? key, required this.contentName})
      : super(key: key);
  final String contentName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Card(
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              if (Provider.of<LocationProvider>(context, listen: false)
                      .location ==
                  '') {
                print('null');
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
                print(context.read<LocationProvider>().location.toString());
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const StartingOptionComponent();
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
