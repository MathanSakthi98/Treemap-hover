import 'package:flutter/material.dart';
import 'package:flutter_treemap_testbed/peer-testing/hover/hover_home_page.dart';

import '../main.dart';

class PeerTestingHome extends StatefulWidget {
  @override
  _PeerTestingHomeState createState() => _PeerTestingHomeState();
}

class _PeerTestingHomeState extends State<PeerTestingHome> {
  late List<Model> _source;

  @override
  void initState() {
    _source = [
      Model('Hover', HoverHomePage()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peer testing home'),
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
