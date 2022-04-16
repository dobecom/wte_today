import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/LocationProvider.dart';
import 'SetLocationComponent.dart';

class SearchComponent extends StatefulWidget {
  SearchComponent({Key? key}) : super(key: key);

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  // final searchController = TextEditingController();
  String inputText = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(children: [
        Expanded(
          child: TextField(
              decoration: const InputDecoration(
                hintText: '위치를 설정하세요',
                // labelText: context.read<LocationProvider>().location.toString(),
              ),
              keyboardType: TextInputType.text,
              onChanged: (text) {
                setState(() {
                  inputText = text;
                });
              },
              // controller: searchController,
              // textInputAction: TextInputAction.go,
              onSubmitted: (value) {
                if (inputText != '') {
                  context.read<LocationProvider>().updateData(inputText);
                  // Provider.of<LocationProvider>(context, listen: false)
                  //     .updateData(value);
                } else {}
              }),
        ),
        IconButton(
            onPressed: () {
              if (inputText != '') {
                context.read<LocationProvider>().updateData(inputText);
                // Provider.of<LocationProvider>(context, listen: false)
                //     .updateData(searchController.text);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SetLocationComponent();
                }));
              }
            },
            icon: const Icon(Icons.search))
      ]),
    );
  }
}
