import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class SquarifiedTabView extends StatefulWidget {
  @override
  _SquarifiedTabViewState createState() => _SquarifiedTabViewState();
}

class _SquarifiedTabViewState extends State<SquarifiedTabView> {
  late List<PopulationModel> _source;

  @override
  void initState() {
    super.initState();
    _source = <PopulationModel>[
      PopulationModel('Africa', 'South Africa', 25.4),
      PopulationModel('South America', 'Chile', 19.11),
      PopulationModel('North America', 'Canada', 13.3),
      PopulationModel('Europe', 'Czech Republic', 10.65),
      PopulationModel('Asia', 'Thailand', 7.54),
      PopulationModel('Australia', 'New Zealand', 4.93),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Treemap in tab view'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.access_alarm)),
                Tab(icon: Icon(Icons.accessible_forward)),
                Tab(icon: Icon(Icons.accessibility)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SfTreemap(
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
                    color: Colors.red,
                  ),
                ],
              ),
              SfTreemap(
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
                    color: Colors.red,
                  ),
                ],
              ),
              SfTreemap(
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
                    color: Colors.red,
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

class PopulationModel {
  const PopulationModel(
      this.continent, this.country, this.populationInMillions);

  final String continent;
  final String country;
  final double populationInMillions;
}
