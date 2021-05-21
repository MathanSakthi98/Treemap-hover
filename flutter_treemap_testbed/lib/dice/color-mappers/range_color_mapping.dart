import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class DiceRangeColorMappingSample extends StatefulWidget {
  @override
  _DiceRangeColorMappingSampleState createState() =>
      _DiceRangeColorMappingSampleState();
}

class _DiceRangeColorMappingSampleState
    extends State<DiceRangeColorMappingSample> {
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
      TreemapColorMapper.range(from: 0, to: 10, color: Colors.green),
      TreemapColorMapper.range(from: 10, to: 20, color: Colors.blue),
      TreemapColorMapper.range(from: 20, to: 30, color: Colors.red),
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
        title: Text("Dice range color mapping"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, top: 2.5, right: 5.0, bottom: 2.5),
              child: SfTreemap.dice(
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
  const Population(
      this.continent, this.populationLevel, this.populationInMillions);

  final String continent;
  final String populationLevel;
  final double populationInMillions;
}
