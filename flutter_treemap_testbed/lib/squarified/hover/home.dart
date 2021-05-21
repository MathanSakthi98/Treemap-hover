import 'package:flutter/material.dart';

import '../../main.dart';
import 'default_hover.dart';
import 'hover_with_selection.dart';
import 'hover_border_squarified.dart';
import 'hover_color_squarified.dart';

class HoverHomePage extends StatefulWidget {
  @override
  _HoverHomePageState createState() => _HoverHomePageState();
}

class _HoverHomePageState extends State<HoverHomePage> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Default hover', SquarifiedDefaultHoverSample()),
      Model('Hover with selection color', SquarifiedHoverWithSelectionSample()),
      Model('Hover Border Flat', SquarifiedFlatHoverBorderSample()),
      Model('Hover Border Hierarchical',
          SquarifiedHoverBorderHierarchicalSample()),
      Model('Hover Color Flat', SquarifiedFlatHoverColorSample()),
      Model(
          'Hover Color Hierarchical', SquarifiedHoverColorHierarchicalSample())
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
