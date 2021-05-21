import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class SquarifiedKeySample extends StatefulWidget {
  @override
  _SquarifiedKeySampleState createState() => _SquarifiedKeySampleState();
}

class _SquarifiedKeySampleState extends State<SquarifiedKeySample> {
  late List<PopulationModel> _source;
  Key? key;

  @override
  void initState() {
    key = UniqueKey();
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
        title: Text('Squarified Key sample'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfTreemap(
              key: key,
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
                  color: Colors.red,
                  labelBuilder: (BuildContext context, TreemapTile tile) {
                    return Text(
                      '${tile.group}\nPopulation : ${tile.weight}M',
                    );
                  },
                ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                key = UniqueKey();
                _source = <PopulationModel>[
                  PopulationModel('Africa', 'South Africa', 12.4),
                  PopulationModel('South America', 'Chile', 19.11),
                  PopulationModel('North America', 'Canada', 23.3),
                  PopulationModel('Europe', 'Czech Republic', 10.65),
                  PopulationModel('Asia', 'Thailand', 17.54),
                  PopulationModel('Australia', 'New Zealand', 4.93),
                ];
              });
            },
            icon: Icon(Icons.build),
            label: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Change data source'),
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
