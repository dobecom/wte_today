import 'package:flutter/material.dart';

class CheckOptionWidget extends StatefulWidget {
  const CheckOptionWidget({Key? key}) : super(key: key);

  @override
  State<CheckOptionWidget> createState() => _CheckOptionWidgetState();
}

class _CheckOptionWidgetState extends State<CheckOptionWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      // checkColor: Colors.white,
      title: Text('여기 옵션이름'),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      // fillColor: Colors.white,
      // value: isChecked,
      // onChanged: (bool? value) {},
    );
  }
}

class StartOption extends StatelessWidget {
  const StartOption({Key? key}) : super(key: key);

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
            Text('시작 설정하기'),
            CheckOptionWidget(),
          ]),
        ),
      ),
    );
  }
}
