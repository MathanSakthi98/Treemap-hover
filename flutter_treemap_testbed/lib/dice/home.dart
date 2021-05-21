import 'package:flutter/material.dart';

import '../main.dart';
import 'bar_legend.dart';
import 'color-mappers/color-mapper-home.dart';
import 'default_selection.dart';
import 'equal_color_legend.dart';
import 'flat.dart';
import 'hierarchical.dart';
import 'hover.dart';
import 'label_builder.dart';
import 'label_builder_sample.dart';
import 'legend_title.dart';
import 'range_color_legend.dart';
import 'rtl.dart';
import 'tap_view.dart';
import 'tooltip/tooltip_animation.dart';
import 'tooltip.dart';
import 'hover_border_dice.dart';
import 'hover_color_dice.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Flat', DiceFlatSample()),
      Model('Hierarchical dice', HierarchicalDiceSample()),
      Model('Legend title', DiceFlatWithDefaultLegendTitle()),
      Model('Range color legend', DiceFlatRangeColorLegend()),
      Model('Equal color legend', DiceFlatEqualColorLegend()),
      Model('Bar legend', DiceFlatBarLegend()),
      Model('Color mapping', DiceColorMapperHomePage()),
      Model('Tooltip', TooltipDiceSample()),
      Model('Label builder', LabelBuilderDiceSample()),
      Model('Label Builder (Small data)', LabelBuilderSample()),
      Model('Tab view', TabViewSample()),
      Model('Default Selection', DefaultSelectionSample()),
      Model('Hover', DiceHoverSample()),
      Model('Tooltip animation sample', DiceTreemapTooltipAnimationSample()),
      Model('RTL', DiceRTLFlatSample()),
      Model('Hover Border Flat', DiceFlatHoverBorderSample()),
      Model('Hover Border Hierarchical', DiceHierarchicalHoverBorderSample()),
      Model('Hover Color flat', DiceFlatHoverColorSample()),
      Model('Hover Color hierarchical', DiceHierarchicalHoverColorSample())
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Treemap'),
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
