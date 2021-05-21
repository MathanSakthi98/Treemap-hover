import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class SliceSelectionSample extends StatefulWidget {
  @override
  _SliceSelectionSampleState createState() => _SliceSelectionSampleState();
}

class _SliceSelectionSampleState extends State<SliceSelectionSample> {
  late TextEditingController _controller;
  late List<Population> _source;
  TreemapTile? _prevTile;

  @override
  void initState() {
    _controller = TextEditingController();
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
      appBar: AppBar(title: Text('Treemap Selection')),
      body: Column(
        children: [
          Expanded(
            child: SfTreemap.slice(
              dataCount: _source.length,
              weightValueMapper: (int index) =>
                  _source[index].populationInMillions,
              levels: [
                TreemapLevel(
                  groupMapper: (int index) => _source[index].continent,
                  color: Colors.green,
                  border: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    // side: BorderSide(color: Colors.black, width: 3),
                  ),
                  padding: EdgeInsets.all(2),
                  labelBuilder: (BuildContext context, TreemapTile tile) {
                    return IgnorePointer(
                        child: Text(
                      'Continent : ${tile.group}',
                    ));
                  },
                  tooltipBuilder: (context, tile) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tile.group,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
              onSelectionChanged: (TreemapTile tile) {
                _controller.text = tile != _prevTile ? 'New tile' : 'Old tile';
                _prevTile = tile;
              },
              selectionSettings: TreemapSelectionSettings(
                color: Colors.green,
                border: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  side: BorderSide(color: Colors.deepPurple[900]!, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 25),
            child: TextFormField(controller: _controller),
          ),
        ],
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
