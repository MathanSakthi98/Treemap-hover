import 'package:flutter/material.dart';

import '../../main.dart';
import 'bar_legend_shape.dart';

class BarLegend extends StatefulWidget {
  @override
  _BarLegendState createState() => _BarLegendState();
}

class _BarLegendState extends State<BarLegend> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Bar legend', InteractiveLegendShape()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shape layer'),
      ),
      body: getSamplePage(_source),
    );
  }
}
