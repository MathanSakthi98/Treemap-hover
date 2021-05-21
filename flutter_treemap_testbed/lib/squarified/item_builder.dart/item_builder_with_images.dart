import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class ImageItemBuilderSample extends StatefulWidget {
  @override
  _ImageItemBuilderSampleState createState() => _ImageItemBuilderSampleState();
}

class _ImageItemBuilderSampleState extends State<ImageItemBuilderSample> {
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
        title: Text('Item builder with images'),
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
              color: Color.fromRGBO(179, 0, 179, 1.0),
              itemBuilder: (BuildContext context, TreemapTile tile) {
                switch (tile.group) {
                  case 'Africa':
                    return Image.asset('images/Taj_Mahal.jpg');
                  case 'South America':
                    return Image.asset('images/maps_facebook.png');
                  case 'Europe':
                    return Image.asset('images/maps_instagram.png');
                  case 'North America':
                    return Image.asset('images/maps_snapchat.png');
                  case 'Asia':
                    return Image.asset('images/maps_tiktok.png');
                  case 'Australia':
                    return Image.asset('images/maps_twitter.png');
                }
                return SizedBox(width: 10, height: 10);
              }),
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
