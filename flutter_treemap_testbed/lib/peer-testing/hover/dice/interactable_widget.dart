import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class HoverWithInteractiveViewer extends StatefulWidget {
  _HoverWithInteractiveViewerState createState() =>
      _HoverWithInteractiveViewerState();
}

class _HoverWithInteractiveViewerState
    extends State<HoverWithInteractiveViewer> {
  late List<Population> _data;

  @override
  void initState() {
    _data = <Population>[
      Population('Asia', 'Thailand', 7.54),
      Population('Africa', 'South Africa', 25.4),
      Population('North America', 'Canada', 13.3),
      Population('South America', 'Chile', 19.11),
      Population('Australia', 'New Zealand', 30.93),
      Population('Europe', 'Czech Republic', 10.65),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _data.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hover with InteractiveViewer')),
        body: InteractiveViewer(
          child: SfTreemap.dice(
            dataCount: _data.length,
            weightValueMapper: (int index) => _data[index].populationInMillions,
            onSelectionChanged: (TreemapTile tile) {},
            levels: [
              TreemapLevel(
                padding: EdgeInsets.all(15),
                groupMapper: (int index) => _data[index].country,
                color: Colors.blue,
              ),
            ],
          ),
        ));
  }
}

class Population {
  const Population(this.continent, this.country, this.populationInMillions);

  final String continent;
  final String country;
  final double populationInMillions;
}
