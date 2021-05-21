import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class SBTreemapRangeColorMappingSample extends StatefulWidget {
  const SBTreemapRangeColorMappingSample({Key? key}) : super(key: key);

  @override
  _SBTreemapRangeColorMappingSampleState createState() =>
      _SBTreemapRangeColorMappingSampleState();
}

class _SBTreemapRangeColorMappingSampleState
    extends State<SBTreemapRangeColorMappingSample> {
  late List<USElectionDataModel> _source;
  late List<TreemapLevel> _levels;
  late List<TreemapColorMapper> _colorMappers;
  SfTreemap? treemap;
  SfTreemap? sliceTreemap;
  SfTreemap? diceTreemap;
  String? dropdownValue;

  @override
  void initState() {
    dropdownValue = 'Squarified';
    _source = <USElectionDataModel>[
      USElectionDataModel(
          state: "Alabama",
          trump: 62.9,
          clinton: 34.6,
          winPercentage: 62.9,
          winner: "Trump",
          population: 4780127),
      USElectionDataModel(
          state: "Alaska",
          trump: 52.9,
          clinton: 37.7,
          winPercentage: 52.9,
          winner: "Trump",
          population: 710249),
      USElectionDataModel(
          state: "Arkansas",
          trump: 60.6,
          clinton: 33.7,
          winPercentage: 60.6,
          winner: "Trump",
          population: 2915958),
      USElectionDataModel(
          state: "Arizona",
          trump: 49.5,
          clinton: 45.4,
          winPercentage: 49.5,
          winner: "Trump",
          population: 6392307),
      USElectionDataModel(
          state: "California",
          trump: 32.8,
          clinton: 61.6,
          winPercentage: 61.6,
          winner: "clinton",
          population: 37252895),
      USElectionDataModel(
          state: "Colorado",
          trump: 47.3,
          clinton: 44.4,
          winPercentage: 47.3,
          winner: "Trump",
          population: 5029324),
      USElectionDataModel(
          state: "Connecticut",
          trump: 41.2,
          clinton: 54.5,
          winPercentage: 54.5,
          winner: "clinton",
          population: 3574118),
      USElectionDataModel(
          state: "Delaware",
          trump: 53.4,
          clinton: 41.9,
          winPercentage: 53.4,
          winner: "Trump",
          population: 897936),
      USElectionDataModel(
          state: "District of Columbia",
          trump: 4.1,
          clinton: 92.8,
          winPercentage: 92.8,
          winner: "clinton",
          population: 693972),
      USElectionDataModel(
          state: "Florida",
          trump: 49.1,
          clinton: 47.8,
          winPercentage: 49.1,
          winner: "Trump",
          population: 18804623),
      USElectionDataModel(
          state: "Georgia",
          trump: 51.3,
          clinton: 45.6,
          winPercentage: 51.3,
          winner: "Trump",
          population: 9688681),
      USElectionDataModel(
          state: "Hawaii",
          trump: 62.2,
          clinton: 30,
          winPercentage: 62.2,
          winner: "Trump",
          population: 1360301),
      USElectionDataModel(
          state: "Idaho",
          trump: 59.2,
          clinton: 27.6,
          winPercentage: 59.2,
          winner: "Trump",
          population: 1567652),
      USElectionDataModel(
          state: "Illinois",
          trump: 55.4,
          clinton: 39.4,
          winPercentage: 55.4,
          winner: "Trump",
          population: 12831549),
      USElectionDataModel(
          state: "Indiana",
          trump: 57.2,
          clinton: 37.9,
          winPercentage: 57.2,
          winner: "Trump",
          population: 6484229),
      USElectionDataModel(
          state: "Iowa",
          trump: 51.8,
          clinton: 42.2,
          winPercentage: 51.8,
          winner: "Trump",
          population: 3046869),
      USElectionDataModel(
          state: "Kansas",
          trump: 57.2,
          clinton: 36.2,
          winPercentage: 57.2,
          winner: "Trump",
          population: 2853132),
      USElectionDataModel(
          state: "Kentucky",
          trump: 62.5,
          clinton: 32.7,
          winPercentage: 62.5,
          winner: "Trump",
          population: 4339349),
      USElectionDataModel(
          state: "Louisiana",
          trump: 58.1,
          clinton: 38.4,
          winPercentage: 58.1,
          winner: "Trump",
          population: 4533479),
      USElectionDataModel(
          state: "Maine",
          trump: 45.2,
          clinton: 47.9,
          winPercentage: 47.9,
          winner: "clinton",
          population: 1328361),
      USElectionDataModel(
          state: "Maryland",
          trump: 35.3,
          clinton: 60.5,
          winPercentage: 60.5,
          winner: "clinton",
          population: 5773785),
      USElectionDataModel(
          state: "Massachusetts",
          trump: 33.5,
          clinton: 60.8,
          winPercentage: 60.8,
          winner: "clinton",
          population: 6547817),
      USElectionDataModel(
          state: "Michigan",
          trump: 47.6,
          clinton: 47.3,
          winPercentage: 47.6,
          winner: "Trump",
          population: 9884129),
      USElectionDataModel(
          state: "Minnesota",
          trump: 45.4,
          clinton: 46.9,
          winPercentage: 46.9,
          winner: "Trump",
          population: 5303925),
      USElectionDataModel(
          state: "Mississippi",
          trump: 58.3,
          clinton: 39.7,
          winPercentage: 58.3,
          winner: "Trump",
          population: 2968103),
      USElectionDataModel(
          state: "Missouri",
          trump: 57.1,
          clinton: 38.0,
          winPercentage: 57.1,
          winner: "Trump",
          population: 5988927),
      USElectionDataModel(
          state: "Montana",
          trump: 56.5,
          clinton: 36.0,
          winPercentage: 56.5,
          winner: "Trump",
          population: 989417),
      USElectionDataModel(
          state: "Nebraska",
          trump: 60.3,
          clinton: 34.0,
          winPercentage: 60.3,
          winner: "Trump",
          population: 1826341),
      USElectionDataModel(
          state: "Nevada",
          trump: 45.5,
          clinton: 47.9,
          winPercentage: 47.9,
          winner: "clinton",
          population: 2700691),
      USElectionDataModel(
          state: "New Hampshire",
          trump: 47.2,
          clinton: 47.6,
          winPercentage: 47.6,
          winner: "clinton",
          population: 1316466),
      USElectionDataModel(
          state: "New Jersey",
          trump: 41.8,
          clinton: 55.0,
          winPercentage: 55,
          winner: "clinton",
          population: 8791936),
      USElectionDataModel(
          state: "New Mexico",
          trump: 40.0,
          clinton: 48.3,
          winPercentage: 48.3,
          winner: "clinton",
          population: 2059192),
      USElectionDataModel(
          state: "New York",
          trump: 37.5,
          clinton: 58.8,
          winPercentage: 58.8,
          winner: "clinton",
          population: 19378087),
      USElectionDataModel(
          state: "North Carolina",
          trump: 50.5,
          clinton: 46.7,
          winPercentage: 50.5,
          winner: "Trump",
          population: 9535692),
      USElectionDataModel(
          state: "North Dakota",
          trump: 64.1,
          clinton: 27.8,
          winPercentage: 64.1,
          winner: "Trump",
          population: 672591),
      USElectionDataModel(
          state: "Ohio",
          trump: 52.1,
          clinton: 43.5,
          winPercentage: 52.5,
          winner: "Trump",
          population: 11536725),
      USElectionDataModel(
          state: "Oklahoma",
          trump: 65.3,
          clinton: 28.9,
          winPercentage: 65.3,
          winner: "Trump",
          population: 3751616),
      USElectionDataModel(
          state: "Oregon",
          trump: 41.1,
          clinton: 51.7,
          winPercentage: 51.7,
          winner: "clinton",
          population: 3831073),
      USElectionDataModel(
          state: "Pennsylvania",
          trump: 48.8,
          clinton: 47.6,
          winPercentage: 48.8,
          winner: "Trump",
          population: 12702887),
      USElectionDataModel(
          state: "Rhode Island",
          trump: 39.8,
          clinton: 55.4,
          winPercentage: 55.4,
          winner: "clinton",
          population: 1052931),
      USElectionDataModel(
          state: "South Carolina",
          trump: 54.9,
          clinton: 40.8,
          winPercentage: 54.9,
          winner: "Trump",
          population: 4625401),
      USElectionDataModel(
          state: "South Dakota",
          trump: 61.5,
          clinton: 31.7,
          winPercentage: 61.5,
          winner: "Trump",
          population: 814191),
      USElectionDataModel(
          state: "Tennessee",
          trump: 61.1,
          clinton: 34.9,
          winPercentage: 61.1,
          winner: "Trump",
          population: 6346275),
      USElectionDataModel(
          state: "Texas",
          trump: 52.6,
          clinton: 43.4,
          winPercentage: 52.6,
          winner: "Trump",
          population: 25146105),
      USElectionDataModel(
          state: "Utah",
          trump: 45.9,
          clinton: 27.8,
          winPercentage: 45.9,
          winner: "Trump",
          population: 2763888),
      USElectionDataModel(
          state: "Vermont",
          trump: 39.7,
          clinton: 61.1,
          winPercentage: 61.1,
          winner: "clinton",
          population: 625745),
      USElectionDataModel(
          state: "Virginia",
          trump: 45.0,
          clinton: 49.9,
          winPercentage: 49.9,
          winner: "clinton",
          population: 8001045),
      USElectionDataModel(
          state: "Washington",
          trump: 4.1,
          clinton: 92.8,
          winPercentage: 92.8,
          winner: "clinton",
          population: 6724543),
      USElectionDataModel(
          state: "Wisconsin",
          trump: 68.7,
          clinton: 26.5,
          winPercentage: 68.7,
          winner: "Trump",
          population: 5687289),
      USElectionDataModel(
          state: "West Virginia",
          trump: 47.9,
          clinton: 46.9,
          winPercentage: 47.9,
          winner: "clinton",
          population: 1853011),
      USElectionDataModel(
          state: "Wyoming",
          trump: 70.1,
          clinton: 22.5,
          winPercentage: 70.1,
          winner: "Trump",
          population: 583767),
    ];

    _colorMappers = _colorMappers = <TreemapColorMapper>[
      TreemapColorMapper.value(value: 'clinton', color: Colors.blue),
      TreemapColorMapper.value(value: 'Trump', color: Colors.red),
    ];

    _levels = <TreemapLevel>[
      TreemapLevel(
        color: Colors.yellow,
        groupMapper: (int index) => _source[index].state,
        padding: EdgeInsets.all(0.5),
        colorValueMapper: (TreemapTile tile) => _source[tile.indices[0]].winner,
        labelBuilder: (BuildContext context, TreemapTile tile) {
          return Padding(
            padding: const EdgeInsets.only(left: 4.0, top: 2.0),
            child: Text(
              tile.group,
              style: Theme.of(context).textTheme.bodyText2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
        tooltipBuilder: (BuildContext context, TreemapTile tile) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'City : ${tile.group} \nPopulation : ${tile.weight.toInt()}',
              style: TextStyle(color: Colors.black),
            ),
          );
        },
      ),
    ];

    treemap = SfTreemap(
      dataCount: _source.length,
      weightValueMapper: (int index) {
        return _source[index].population;
      },
      colorMappers: _colorMappers,
      levels: _levels,
    );
    diceTreemap = SfTreemap.dice(
      dataCount: _source.length,
      weightValueMapper: (int index) {
        return _source[index].population;
      },
      colorMappers: _colorMappers,
      levels: _levels,
    );
    sliceTreemap = SfTreemap.slice(
      dataCount: _source.length,
      weightValueMapper: (int index) {
        return _source[index].population;
      },
      colorMappers: _colorMappers,
      levels: _levels,
    );

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
      endDrawer: Drawer(
          child: ListView(children: <Widget>[
        Container(
            height: 40.0,
            child: DrawerHeader(
                padding: const EdgeInsets.fromLTRB(103, 7, 0, 0),
                margin: const EdgeInsets.all(0),
                child: const Text('Properties',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times')),
                decoration: BoxDecoration(color: Colors.blue[300]))),
        DropdownButton<String>(
          value: dropdownValue,
          isExpanded: true,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue;
              Navigator.pop(context);
            });
          },
          items: <String>['Squarified', 'Slice', 'Dice']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ])),
      appBar: AppBar(),
      body: MediaQuery.of(context).orientation == Orientation.portrait || kIsWeb
          ? _getTreemapWidget()
          : SingleChildScrollView(child: _getTreemapWidget()),
    );
  }

  Widget _getTreemapWidget() {
    return Center(
      child: Padding(
        padding:
            MediaQuery.of(context).orientation == Orientation.portrait || kIsWeb
                ? EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.025,
                    bottom: MediaQuery.of(context).size.height * 0.025,
                    right: 10,
                    left: 10)
                : const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('US Election Results 2020'),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2.5, 12.5, 2.5, 2.5),
                child: dropdownValue == 'Dice'
                    ? diceTreemap
                    : (dropdownValue == 'Slice' ? sliceTreemap : treemap),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class USElectionDataModel {
  const USElectionDataModel(
      {required this.state,
      required this.trump,
      required this.clinton,
      required this.winPercentage,
      required this.winner,
      required this.population});

  final String state;
  final double trump;
  final double clinton;
  final double winPercentage;
  final String winner;
  final double population;
}
