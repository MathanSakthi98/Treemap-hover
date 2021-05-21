import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

import '../main.dart';

class SquarifiedFlatSample extends StatefulWidget {
  @override
  _SquarifiedFlatSampleState createState() => _SquarifiedFlatSampleState();
}

class _SquarifiedFlatSampleState extends State<SquarifiedFlatSample> {
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
        title: Text('Squarified Flat Level'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfTreemap(
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
                      tile.group,
                      style: TextStyle(color: getTextColor(tile.color)),
                    );
                  },
                ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.build),
            label: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Rebuild'),
            ),
          ),
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
