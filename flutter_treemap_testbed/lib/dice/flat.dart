import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

import '../main.dart';

class DiceFlatSample extends StatefulWidget {
  @override
  _DiceFlatSampleState createState() => _DiceFlatSampleState();
}

class _DiceFlatSampleState extends State<DiceFlatSample> {
  late List<Population> _source;

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
        title: Text('Dice flat level'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 2.5, top: 5.0, right: 2.5, bottom: 5.0),
        child: SfTreemap.dice(
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
          legend: TreemapLegend(
            iconSize: Size(15, 15),
            iconType: TreemapIconType.diamond,
            position: TreemapLegendPosition.bottom,
          ),
        ),
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
