import 'package:flutter/material.dart';

import '../../main.dart';
import 'equal_color_mapping.dart';
import 'range_color_mapping.dart';

class DiceColorMapperHomePage extends StatefulWidget {
  @override
  _DiceColorMapperHomePageState createState() =>
      _DiceColorMapperHomePageState();
}

class _DiceColorMapperHomePageState extends State<DiceColorMapperHomePage> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Range color mapping', DiceRangeColorMappingSample()),
      Model('Equal color mapping', DiceEqualColorMappingSample()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice color mapper home page'),
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
