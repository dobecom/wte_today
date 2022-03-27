import 'package:flutter/material.dart';

import 'SelectRestaurantComponent.dart';

class CheckOptionWidget extends StatefulWidget {
  const CheckOptionWidget({Key? key, required this.optionName})
      : super(key: key);
  final String optionName;

  @override
  State<CheckOptionWidget> createState() => _CheckOptionWidgetState();
}

class _CheckOptionWidgetState extends State<CheckOptionWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkColor: Colors.white,
      title: Text(widget.optionName),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

List<String> optionArr = ['option1', 'option2', 'option3'];

class StartingOptionComponent extends StatelessWidget {
  const StartingOptionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(32),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Column(children: [
          const Text('시작 설정'),
          Column(children: _getOptionArr()),
          Container(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              child: Row(children: [
                const Text('시작하기'),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SelectRestaurantComponent();
                    }));
                  },
                  icon: const Icon(Icons.start),
                )
              ]),
              onTap: () {
                print('start!');
              },
            ),
          ),
        ]),
      ),
    ));
  }

  _getOptionArr() {
    return optionArr
        .map((option) => CheckOptionWidget(
              optionName: option,
            ))
        .toList();
  }
}
