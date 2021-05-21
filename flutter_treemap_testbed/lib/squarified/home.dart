import 'package:flutter/material.dart';

import '../main.dart';
import 'SB sample.dart';
import 'bar_legend/bar_legend_shape.dart';
import 'default_selection.dart';
import 'flat.dart';
import 'hierarchical.dart';
import 'hover/home.dart';
import 'item_builder.dart/item_builder_home.dart';
import 'keys.dart';
import 'label_builder.dart';
import 'label_builder_sample.dart';
import 'rtl.dart';
import 'selection.dart';
import 'tab_view.dart';
import 'tooltip/Dynamically_update_tooltip.dart';
import 'tooltip/tooltip_animation.dart';
import 'tooltip.dart';

class Squarified extends StatefulWidget {
  @override
  _SquarifiedState createState() => _SquarifiedState();
}

class _SquarifiedState extends State<Squarified> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Flat', SquarifiedFlatSample()),
      Model('Hierarchical', SquarifiedHierarchicalSample()),
      Model('Tab View', SquarifiedTabView()),
      Model('Key', SquarifiedKeySample()),
      Model('Label Builder', LabelBuilderSquarifiedSample()),
      Model('Label Builder (Small data)', LabelBuilderSample()),
      Model('Tooltip', SquarifiedTreemapTooltipSample()),
      Model('Default Selection', DefaultSelectionSample()),
      Model('Selection', SquarifiedSelectionSample()),
      Model('Hover', HoverHomePage()),
      Model('Item builder', ItemBuilderHome()),
      Model('SB Sample', SBTreemapRangeColorMappingSample()),
      Model('Tooltip animation sample',
          SquarifiedTreemapTooltipAnimationSample()),
      Model('Bar legend', InteractiveLegendShape()),
      Model('Update tooltip dynamically', UpdateTooltipDynamicallySample()),
      Model('RTL', SquarifiedRTLFlatSample())
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Squarified Treemap'),
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
