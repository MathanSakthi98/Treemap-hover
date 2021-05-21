import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class DiceFlatRangeColorLegend extends StatefulWidget {
  @override
  _DiceFlatRangeColorLegendState createState() =>
      _DiceFlatRangeColorLegendState();
}

class _DiceFlatRangeColorLegendState extends State<DiceFlatRangeColorLegend> {
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
        title: Text("Slice Range Color Legend"),
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
              colorValueMapper: (TreemapTile tile) {
                return _source[tile.indices[0]].populationInMillions;
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
            segmentPaintingStyle: TreemapLegendPaintingStyle.gradient,
          ),
          colorMappers: [
            TreemapColorMapper.range(from: 0.0, to: 10.0, color: Colors.red),
            TreemapColorMapper.range(
                from: 10.01, to: 20.0, color: Colors.green),
            TreemapColorMapper.range(from: 20.01, to: 30.0, color: Colors.blue),
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
