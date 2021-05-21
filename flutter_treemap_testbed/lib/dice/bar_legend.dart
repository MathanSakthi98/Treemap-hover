import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class DiceFlatBarLegend extends StatefulWidget {
  @override
  _DiceFlatBarLegendState createState() => _DiceFlatBarLegendState();
}

class _DiceFlatBarLegendState extends State<DiceFlatBarLegend> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Bar Legend"),
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
              padding: EdgeInsets.only(left: 2.5, right: 2.5),
              groupMapper: (int index) {
                return _source[index].continent;
              },
              labelBuilder: (BuildContext context, TreemapTile tile) {
                return Text(
                  'Continent : ${tile.group}',
                );
              },
              color: Colors.teal,
            ),
          ],
          legend: TreemapLegend.bar(
              position: TreemapLegendPosition.bottom,
              segmentPaintingStyle: TreemapLegendPaintingStyle.gradient,
              edgeLabelsPlacement: TreemapLegendEdgeLabelsPlacement.center,
              labelsPlacement: TreemapLegendLabelsPlacement.onItem),
          colorMappers: [
            TreemapColorMapper.range(from: 0, to: 10, color: Colors.red),
            TreemapColorMapper.range(from: 11, to: 20, color: Colors.green),
            TreemapColorMapper.range(from: 21, to: 30, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}

class Population {
  const Population(this.continent, this.country, this.populationInMillions);

  final String country;
  final String continent;
  final double populationInMillions;
}
