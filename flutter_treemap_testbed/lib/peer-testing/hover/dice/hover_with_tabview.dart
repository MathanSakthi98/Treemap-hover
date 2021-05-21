import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class HoverWithTabView extends StatefulWidget {
  _HoverWithTabViewState createState() => _HoverWithTabViewState();
}

class _HoverWithTabViewState extends State<HoverWithTabView> {
  late List<Population> _data;
  late List<TreemapModel> _hierarchicalData;

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

    _hierarchicalData = <TreemapModel>[
      TreemapModel(country: 'America', job: 'Sales', vacancy: 70),
      TreemapModel(
          country: 'America', job: 'Technical', group: 'Testers', vacancy: 35),
      TreemapModel(
          country: 'America',
          job: 'Technical',
          group: 'Developers',
          role: 'Windows',
          vacancy: 105),
      TreemapModel(
          country: 'America',
          job: 'Technical',
          group: 'Developers',
          role: 'Web',
          vacancy: 40),
      TreemapModel(country: 'America', job: 'Management', vacancy: 40),
      TreemapModel(country: 'America', job: 'Accounts', vacancy: 60),
      TreemapModel(
          country: 'India', job: 'Technical', group: 'Testers', vacancy: 25),
      TreemapModel(
          country: 'India',
          job: 'Technical',
          group: 'Developers',
          role: 'Windows',
          vacancy: 155),
      TreemapModel(
          country: 'India',
          job: 'Technical',
          group: 'Developers',
          role: 'Web',
          vacancy: 60),
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
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              SfTreemap.dice(
                dataCount: _data.length,
                weightValueMapper: (int index) =>
                    _data[index].populationInMillions,
                onSelectionChanged: (TreemapTile tile) {},
                levels: [
                  TreemapLevel(
                    padding: EdgeInsets.all(15),
                    groupMapper: (int index) => _data[index].country,
                    color: Colors.blue,
                  ),
                ],
              ),
              SfTreemap.dice(
                dataCount: _hierarchicalData.length,
                weightValueMapper: (int index) =>
                    _hierarchicalData[index].vacancy,
                onSelectionChanged: (TreemapTile tile) {},
                levels: [
                  TreemapLevel(
                      padding: EdgeInsets.all(5),
                      groupMapper: (int index) =>
                          _hierarchicalData[index].country,
                      color: Colors.green[200],
                      labelBuilder: (BuildContext context, TreemapTile tile) {
                        return IgnorePointer(
                          child: Text(
                            tile.group + '\n' + tile.weight.toString(),
                            style: TextStyle(color: Colors.purpleAccent),
                          ),
                        );
                      }),
                  TreemapLevel(
                      padding: EdgeInsets.all(5),
                      groupMapper: (int index) => _hierarchicalData[index].job,
                      color: Colors.blue[200],
                      labelBuilder: (BuildContext context, TreemapTile tile) {
                        return IgnorePointer(
                          child: Text(
                            tile.group + '\n' + tile.weight.toString(),
                            style: TextStyle(color: Colors.green),
                          ),
                        );
                      }),
                  TreemapLevel(
                    padding: EdgeInsets.all(5),
                    groupMapper: (int index) => _hierarchicalData[index].group,
                    color: Colors.pink[200],
                  ),
                ],
              ),
            ],
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

class TreemapModel {
  const TreemapModel(
      {required this.country,
      this.job,
      this.group,
      this.role,
      required this.vacancy});
  final String country;
  final String? job;
  final String? group;
  final String? role;
  final double vacancy;
}
