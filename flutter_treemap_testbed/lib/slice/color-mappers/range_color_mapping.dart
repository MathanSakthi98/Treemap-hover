import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class RangeColorMappingFlatSample extends StatefulWidget {
  @override
  _RangeColorMappingFlatSampleState createState() =>
      _RangeColorMappingFlatSampleState();
}

class _RangeColorMappingFlatSampleState
    extends State<RangeColorMappingFlatSample> {
  late List<Population> _source;
  late List<TreemapColorMapper> _colorMappers;

  @override
  void initState() {
    _source = <Population>[
      Population('Asia', 'Thailand', 7.54),
      Population('Africa', 'South Africa', 25.4),
      Population('North America', 'Canada', 13.3),
      Population('South America', 'Chile', 19.11),
      Population('Australia', 'New Zealand', 4.93),
      Population('Europe', 'Czech Republic', 10.65),
    ];

    _colorMappers = <TreemapColorMapper>[
      TreemapColorMapper.range(from: 0.0, to: 15.0, color: Colors.blue),
      TreemapColorMapper.range(from: 15.0, to: 30.0, color: Colors.green),
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
        title: Text("Slice Range Color Mapping"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, top: 2.5, right: 5.0, bottom: 2.5),
              child: SfTreemap.slice(
                dataCount: _source.length,
                colorMappers: _colorMappers,
                weightValueMapper: (int index) {
                  return _source[index].populationInMillions;
                },
                levels: [
                  TreemapLevel(
                    padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
                    groupMapper: (int index) {
                      return _source[index].continent;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return Text(
                        'Continent : ${tile.group}',
                      );
                    },
                    color: Colors.pink[900],
                    colorValueMapper: (TreemapTile tile) => tile.weight,
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
