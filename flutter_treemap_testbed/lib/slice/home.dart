import 'package:flutter/material.dart';
import 'package:flutter_treemap_testbed/slice/color-mappers/slice-mapper-home-page.dart';

import '../main.dart';
import 'default_selection.dart';
import 'flat.dart';
import 'hierarchical.dart';
import 'hover.dart';
import 'label_builder.dart';
import 'label_builder_sample.dart';
import 'rtl.dart';
import 'selection.dart';
import 'tooltip/tooltip_animation.dart';
import 'tooltip.dart';
import 'hover_border_slice.dart';
import 'hover_color_slice.dart';

class Slice extends StatefulWidget {
  @override
  _SliceState createState() => _SliceState();
}

class _SliceState extends State<Slice> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Flat', SliceFlatSample()),
      Model('Hierarchical', SliceHierarchicalSample()),
      Model('Color mapping', SliceColorMapperHomePage()),
      Model('Tooltip', TooltipSliceSample()),
      Model('Label builder', LabelBuilderSliceSample()),
      Model('Label Builder (Small data)', LabelBuilderSample()),
      Model('Default Selection', DefaultSelectionSample()),
      Model('Selection', SliceSelectionSample()),
      Model('Hover', SliceHoverSample()),
      Model('Tooltip animation', SliceTreemapTooltipAnimationSample()),
      Model('RTL', SliceRTLFlatSample()),
      Model('Hover Border Flat', SliceFlatHoverBorderSample()),
      Model('Hover Border Hierarchical', SliceHierarchicalHoverBorderSample()),
      Model('Hover Color flat', SliceFlatHoverColorSample()),
      Model('Hover Color hierarchical', SliceHierarchicalHoverColorSample())
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slice Treemap'),
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
