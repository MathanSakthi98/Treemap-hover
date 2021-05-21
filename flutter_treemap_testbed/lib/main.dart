import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

import 'dice/home.dart';
import 'peer-testing/peer-testing-home.dart';
import 'slice/home.dart';
import 'squarified/home.dart';

Color getTextColor(Color color) {
  final Brightness brightness = ThemeData.estimateBrightnessForColor(color);
  return brightness == Brightness.dark ? Colors.white : Colors.black;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Squarified', Squarified()),
      Model('Slice', Slice()),
      Model('Dice', Dice()),
      Model('Peer testing', PeerTestingHome()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treemap widget'),
      ),
      body: ListView.builder(
        itemCount: _source.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${_source[index].title}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return _source[index].page;
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

  Widget getSamplePage(List<Model> source) {
    return ListView.builder(
      itemCount: source.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('${source[index].title}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return source[index].page;
                },
              ),
            );
          },
        );
      },
    );
  }


class Model {
  Model(this.title, this.page);

  String title;

  Widget page;
}

  class SocialMediaUsers {
  const SocialMediaUsers({
  required this.country,
  required this.socialMedia,
  required this.usersInMillions,
  });

  final String country;
  final String socialMedia;
  final double usersInMillions;
  }

