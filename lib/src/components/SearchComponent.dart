import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/LocationProvider.dart';

class SearchComponent extends StatelessWidget {
  SearchComponent({Key? key}) : super(key: key);

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(children: [
        Expanded(
          child: TextField(
              decoration: const InputDecoration(
                hintText: '위치를 설정하세요',
              ),
              keyboardType: TextInputType.text,
              controller: searchController,
              // textInputAction: TextInputAction.go,
              onSubmitted: (value) {
                if (value != '') {
                  context.read<LocationProvider>().updateData(value);
                  // Provider.of<LocationProvider>(context, listen: false)
                  //     .updateData(value);
                } else {}
              }),
        ),
        IconButton(
            onPressed: () {
              if (searchController.text != '') {
                context
                    .read<LocationProvider>()
                    .updateData(searchController.text);
                // Provider.of<LocationProvider>(context, listen: false)
                //     .updateData(searchController.text);
              } else {}
            },
            icon: const Icon(Icons.search))
      ]),
    );
  }
}
