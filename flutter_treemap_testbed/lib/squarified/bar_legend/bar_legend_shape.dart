import 'package:flutter/material.dart';

import '../../main.dart';
import 'gradient_range_color.dart';
import 'range_color_mapper_sample.dart';
import 'equal_color_mapping.dart';
import 'range_color_mapper_with_custom_text.dart';

class InteractiveLegendShape extends StatefulWidget {
  @override
  _InteractiveLegendShapeState createState() => _InteractiveLegendShapeState();
}

class _InteractiveLegendShapeState extends State<InteractiveLegendShape> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Range color mapper', InteractiveLegendShapeSample()),
      Model('Equal color mapper', EqualColorMappingTestingSample()),
      Model('Range color mapper with custom text',
          RangeColorMapperCustomTextSample()),
      Model('Gradient sample', RangeColorGradientSample()),
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
