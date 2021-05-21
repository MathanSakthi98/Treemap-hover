import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class DiceFlatEqualColorLegend extends StatefulWidget {
  @override
  _DiceFlatEqualColorLegendState createState() =>
      _DiceFlatEqualColorLegendState();
}

class _DiceFlatEqualColorLegendState extends State<DiceFlatEqualColorLegend> {
  late List<Population> _source;

  @override
  void initState() {
    _source = <Population>[
      Population('Asia', 'High', 7.54),
      Population('Africa', 'Low', 25.4),
      Population('North America', 'Medium', 13.3),
      Population('South America', 'Medium', 19.11),
      Population('Australia', 'Medium', 4.93),
      Population('Europe', 'Low', 10.65),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Equal Color Mapping"),
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
                colorValueMapper: (TreemapTile tile) {
                  final int index = tile.indices[0];
                  return _source[index].populationDensity;
                }),
          ],
          legend: TreemapLegend.bar(
              position: TreemapLegendPosition.bottom,
              segmentPaintingStyle: TreemapLegendPaintingStyle.gradient,
              labelsPlacement: TreemapLegendLabelsPlacement.betweenItems),
          colorMappers: [
            TreemapColorMapper.value(value: 'Low', color: Colors.blue),
            TreemapColorMapper.value(value: 'Medium', color: Colors.green),
            TreemapColorMapper.value(value: 'High', color: Colors.red),
          ],
        ),
      ),
    );
  }
}

class Population {
  const Population(
      this.continent, this.populationDensity, this.populationInMillions);

  final String continent;
  final String populationDensity;
  final double populationInMillions;
}
