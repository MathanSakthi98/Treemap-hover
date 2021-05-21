import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

import '../main.dart';

class SliceFlatSample extends StatefulWidget {
  @override
  _SliceFlatSampleState createState() => _SliceFlatSampleState();
}

class _SliceFlatSampleState extends State<SliceFlatSample> {
  late List<Population> _source;
  @override
  void initState() {
    _source = <Population>[
      Population('Asia', 'Thailand', 7.54),
      Population('Asia', 'india', 7.54),
      Population('Africa', 'South Africa', 25.4),
      Population('North America', 'Canada', 13.3),
      Population('South America', 'Chile', 19.11),
      Population('Australia', 'New Zealand', 4.93),
      Population('Europe', 'Czech Republic', 10.65),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _source.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slice flat level"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, top: 2.5, right: 5.0, bottom: 2.5),
              child: SfTreemap.slice(
                dataCount: _source.length,
                weightValueMapper: (int index) {
                  return _source[index].populationInMillions;
                },
                levels: [
                  TreemapLevel(
                    groupMapper: (int index) {
                      return _source[index].continent;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return Text(
                        'Continent : ${tile.group}',
                        style: TextStyle(color: getTextColor(tile.color)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.build),
            label: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text('Rebuild'),
            ),
          ),
        ],
      ),
    );
  }
}

class Population {
  const Population(this.continent, this.country, this.populationInMillions);

  final String continent;
  final String country;
  final double populationInMillions;
}
