import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class SliceEqualColorMappingSample extends StatefulWidget {
  @override
  _SliceEqualColorMappingSampleState createState() =>
      _SliceEqualColorMappingSampleState();
}

class _SliceEqualColorMappingSampleState
    extends State<SliceEqualColorMappingSample> {
  late List<Population> _source;
  late List<TreemapColorMapper> _colorMappers;

  @override
  void initState() {
    _source = <Population>[
      Population('Asia', 'Over', 7.54),
      Population('Africa', 'Medium', 25.4),
      Population('North America', 'Medium', 13.3),
      Population('South America', 'Over', 19.11),
      Population('Australia', 'Lesser', 4.93),
      Population('Europe', 'Lesser', 10.65),
    ];

    _colorMappers = <TreemapColorMapper>[
      TreemapColorMapper.value(value: 'Lesser', color: Colors.green),
      TreemapColorMapper.value(value: 'Medium', color: Colors.blue),
      TreemapColorMapper.value(value: 'Over', color: Colors.red),
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
        title: Text("Slice Equal Color Mapping"),
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
                    colorValueMapper: (TreemapTile tile) => 'Lesser',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Population {
  const Population(
      this.continent, this.populationLevel, this.populationInMillions);

  final String continent;
  final String populationLevel;
  final double populationInMillions;
}
