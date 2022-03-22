import 'package:flutter/material.dart';
import 'src/components/RestaurantDetail.dart';
import 'src/components/StartOption.dart';
import 'src/models/Restaurants.dart';

void main() {
  runApp(const MyApp());
}

Widget registerRestaurantWidget = Container(
  padding: const EdgeInsets.all(32),
  child: Card(
    child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: const SizedBox(
          width: 300,
          height: 150,
          child: Text('즐겨찾는 식당 등록'),
        )),
  ),
);

class startOlympicWidget extends StatelessWidget {
  const startOlympicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Card(
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StartOption();
              }));
            },
            child: const SizedBox(
              width: 300,
              height: 150,
              child: Text('16강 올림픽 시작'),
            )),
      ),
    );
  }
}
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

Widget searchTextField = Container(
  padding: const EdgeInsets.all(5),
  child: Row(
    children: [
      Expanded(
        child: TextFormField(
          decoration: const InputDecoration(hintText: '위치를 설정하세요'),
        ),
      ),
      IconButton(onPressed: () {}, icon: const Icon(Icons.search))
    ],
  ),
);

Widget textSection = const Padding(
  padding: EdgeInsets.all(32),
  child: Text(
    'Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior})',
    softWrap: true,
  ),
);

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      ),
      const Icon(
        Icons.star,
        color: Colors.red,
      ),
      const Text('41')
    ],
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'hi',
          ),
        ),
      ],
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(buttonSection: buttonSection),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ]);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.buttonSection,
  }) : super(key: key);

  final Widget buttonSection;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          searchTextField,
          const startOlympicWidget(),
          registerRestaurantWidget,
          // Image.asset(
          //   'lib/images/platform.png',
          //   width: 600,
          //   height: 240,
          //   fit: BoxFit.cover,
          // ),
          // titleSection,
          // textSection,
          // for (var restaurant in restaurants)
          //   ListTile(
          //       leading: Image.network(restaurant.picture as String),
          //       title: Text(restaurant.name as String),
          //       onTap: () => {
          //             Navigator.of(context).push(MaterialPageRoute(
          //                 builder: (context) => RestaurantDetail(restaurant)))
          //           }),
        ],
      ),
    );
  }
}
