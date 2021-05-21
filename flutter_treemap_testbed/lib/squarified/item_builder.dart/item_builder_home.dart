import 'package:flutter/material.dart';

import '../../main.dart';
import 'item_builder_with_icon.dart';
import 'item_builder_with_text.dart';
import 'item_builder_with_images.dart';

class ItemBuilderHome extends StatefulWidget {
  @override
  _ItemBuilderHomeState createState() => _ItemBuilderHomeState();
}

class _ItemBuilderHomeState extends State<ItemBuilderHome> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Item builder with text', TextItemBuilderSample()),
      Model('Icon with item builder', IconItemBuilderSample()),
      Model('Image with item builder', ImageItemBuilderSample())
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item builder Treemap'),
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
