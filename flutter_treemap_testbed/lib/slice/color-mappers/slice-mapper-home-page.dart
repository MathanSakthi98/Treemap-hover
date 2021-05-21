import 'package:flutter/material.dart';

import '../../main.dart';
import 'range-mapper-with-custom-text.dart';
import 'range_color_mapping.dart';
import 'slice-equal-color-mapper.dart';

class SliceColorMapperHomePage extends StatefulWidget {
  @override
  _SliceColorMapperHomePageState createState() =>
      _SliceColorMapperHomePageState();
}

class _SliceColorMapperHomePageState extends State<SliceColorMapperHomePage> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Range color mapping', RangeColorMappingFlatSample()),
      Model('Range color with custom text', RangeMappingWithCustomText()),
      Model('Equal color mapping', SliceEqualColorMappingSample()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slice color mapper home page'),
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
