import 'package:flutter/material.dart';

import '../../main.dart';
import 'dice/dice_hover_home.dart';
import 'slice/slice_hover_home.dart';
import 'squarified/squarify_hover_home.dart';

class HoverHomePage extends StatefulWidget {
  @override
  _HoverHomePageState createState() => _HoverHomePageState();
}

class _HoverHomePageState extends State<HoverHomePage> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Dice', DiceHoverHome()),
      Model('Slice', SliceHoverHome()),
      Model('Squarified', SquarifiedHoverHome()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hover home page'),
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
