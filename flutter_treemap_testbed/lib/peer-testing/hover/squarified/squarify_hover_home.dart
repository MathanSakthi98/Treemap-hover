import 'package:flutter/material.dart';
import 'package:flutter_treemap_testbed/peer-testing/hover/squarified/default_hover.dart';
import 'package:flutter_treemap_testbed/peer-testing/hover/squarified/hover_with_dark_them.dart';
import 'package:flutter_treemap_testbed/peer-testing/hover/squarified/hover_with_selection.dart';
import 'package:flutter_treemap_testbed/peer-testing/hover/squarified/hover_with_tabview.dart';
import 'package:flutter_treemap_testbed/peer-testing/hover/squarified/hover_with_tooltip.dart';
import 'package:flutter_treemap_testbed/peer-testing/hover/squarified/interactable_widget.dart';
import 'package:flutter_treemap_testbed/peer-testing/hover/squarified/update-treemap-level.dart';
import 'package:flutter_treemap_testbed/peer-testing/hover/squarified/with_GestureDetector.dart';

import '../../../main.dart';

class SquarifiedHoverHome extends StatefulWidget {
  @override
  _SquarifiedHoverHomeState createState() => _SquarifiedHoverHomeState();
}

class _SquarifiedHoverHomeState extends State<SquarifiedHoverHome> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Default hover', DefaultHover()),
      Model('With InteractiveViewer', HoverWithInteractiveViewer()),
      Model('With TabView', HoverWithTabView()),
      Model('With tooltip', HoverWithTooltip()),
      Model('With selection', HoverWithSelection()),
      Model('Wrapped labelBuilder with GestureDetector', WithGestureDetector()),
      Model('Update levels dynamically', UpdateTreemapLevel()),
      Model('With dark theme', HoverWithDarkTheme()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Squarified hover'),
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
