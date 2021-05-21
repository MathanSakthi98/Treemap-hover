import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class TextItemBuilderSample extends StatefulWidget {
  @override
  _TextItemBuilderSampleState createState() => _TextItemBuilderSampleState();
}

class _TextItemBuilderSampleState extends State<TextItemBuilderSample> {
  late List<PopulationModel> _source;

  @override
  void initState() {
    _source = <PopulationModel>[
      PopulationModel('Africa', 'South Africa', 25.4),
      PopulationModel('South America', 'Chile', 19.11),
      PopulationModel('North America', 'Canada', 13.3),
      PopulationModel('Europe', 'Czech Republic', 10.65),
      PopulationModel('Asia', 'Thailand', 7.54),
      PopulationModel('Australia', 'New Zealand', 4.93),
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
        title: Text('Item builder with Text'),
      ),
      body: SfTreemap(
        dataCount: _source.length,
        weightValueMapper: (int index) {
          return _source[index].populationInMillions;
        },
        levels: [
          TreemapLevel(
            padding: EdgeInsets.all(2),
            groupMapper: (int index) {
              return _source[index].continent;
            },
            color: Colors.cyan,
            itemBuilder: (BuildContext context, TreemapTile tile) {
              return Text(tile.group);
            },
          ),
          // TreemapLevel(
          //     padding: EdgeInsets.all(2),
          //     groupMapper: (int index) {
          //       return _source[index].country;
          //     },
          //     color: Colors.red,
          //     itemBuilder: (BuildContext context, TreemapTile tile) {
          //      return Text(tile.group);
          //     },
          // ),
        ],
      ),
    );
  }
}

class PopulationModel {
  const PopulationModel(
      this.continent, this.country, this.populationInMillions);

  final String continent;
  final String country;
  final double populationInMillions;
}
