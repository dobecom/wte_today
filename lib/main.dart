import 'package:flutter/material.dart';
import 'package:wte_today/src/components/MainContentComponent.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class SearchTextField extends StatelessWidget {
  SearchTextField({Key? key}) : super(key: key);

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(children: [
        Expanded(
          child: TextField(
              decoration: const InputDecoration(hintText: '위치를 설정하세요'),
              controller: searchController,
              // textInputAction: TextInputAction.go,
              onSubmitted: (value) {
                if (value != '') {
                  Provider.of<Data>(context, listen: false).updateData(value);
                } else {}
              }),
        ),
        IconButton(
            onPressed: () {
              if (searchController.text != '') {
                Provider.of<Data>(context, listen: false)
                    .updateData(searchController.text);
              } else {}
            },
            icon: const Icon(Icons.search))
      ]),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String location = '';
  // Map data = {'name': 'Sammy Shark', 'email': 'example@example.com', 'age': 42};

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<Data>(
    //   create: (context) => Data(),
    //   child: MaterialApp(
    //     home: AccountScreen(),
    //     routes: {
    //       'account': (context) => AccountScreen(),
    //       'settings': (context) => SettingsScreen(),
    //     },
    //   ),
    // );
    return Provider<Data>(
      create: (context) => Data(),
      child: Scaffold(
        body: ListView(
          children: [
            SearchTextField(),
            const MainContentComponent(),
          ],
        ),
      ),
    );
  }
}

class Data extends ChangeNotifier {
  // Map data = {'name': 'Sammy Shark', 'email': 'example@example.com', 'age': 42};
  String location = '';
  void updateData(input) {
    location = input;
    notifyListeners();
  }
}
// Widget textSection = const Padding(
//   padding: EdgeInsets.all(32),
//   child: Text(
//     'Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior})',
//     softWrap: true,
//   ),
// );

// Widget titleSection = Container(
//   padding: const EdgeInsets.all(32),
//   child: Row(
//     children: [
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: const Text(
//                 'Oeschinen Lake Campground',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Text(
//               'Kandersteg, Switzerland',
//               style: TextStyle(color: Colors.grey[500]),
//             ),
//           ],
//         ),
//       ),
//       const Icon(
//         Icons.star,
//         color: Colors.red,
//       ),
//       const Text('41')
//     ],
//   ),
// );

// Widget startOlympicWidget = Container(
//   padding: const EdgeInsets.all(32),
//   child: Card(
//     child: InkWell(
//         splashColor: Colors.blue.withAlpha(30),
//         onTap: () {
//           Navigator.push(context, )
//         },
//         child: const SizedBox(
//           width: 300,
//           height: 150,
//           child: Text('16강 올림픽 시작'),
//         )),
//   ),
// );

// Color color = Theme.of(context).primaryColor;
//     Widget buttonSection = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildButtonColumn(color, Icons.call, 'CALL'),
//         _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//         _buildButtonColumn(color, Icons.share, 'SHARE'),
//         TextFormField(
//           decoration: const InputDecoration(
//             hintText: 'hi',
//           ),
//         ),
//       ],
//     );

// Column _buildButtonColumn(Color color, IconData icon, String label) {
//   return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//           margin: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ]);
