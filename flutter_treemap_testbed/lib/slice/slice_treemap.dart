import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class SliceFlatSample extends StatefulWidget {
  @override
  _SliceFlatSampleState createState() => _SliceFlatSampleState();
}

class _SliceFlatSampleState extends State<SliceFlatSample> {
  late List<TreemapModel> _source;
  @override
  void initState() {
    _source = <TreemapModel>[
      TreemapModel('Asia', 'Thailand', 7.54),
      TreemapModel('Africa', 'South Africa', 25.4),
      TreemapModel('North America', 'Canada', 13.3),
      TreemapModel('South America', 'Chile', 19.11),
      TreemapModel('Australia', 'New Zealand', 4.93),
      TreemapModel('Europe', 'Czech Republic', 10.65),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Slice treemap"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              left: 5.0, top: 2.5, right: 5.0, bottom: 2.5),
          child: SfTreemap.slice(
            dataCount: _source.length,
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
                color: Colors.deepPurpleAccent,
              ),
            ],
            legend: TreemapLegend(
              position: TreemapLegendPosition.left,
            ),
          ),
        ));
  }
}

class TreemapModel {
  const TreemapModel(this.continent, this.country, this.populationInMillions);

  final String country;
  final String continent;
  final double populationInMillions;
}
