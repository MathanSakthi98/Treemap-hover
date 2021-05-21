import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class DiceFlatHoverColorSample extends StatefulWidget {
  _DiceFlatHoverColorSampleState createState() =>
      _DiceFlatHoverColorSampleState();
}

class _DiceFlatHoverColorSampleState extends State<DiceFlatHoverColorSample> {
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
      appBar: AppBar(title: Text('Default hover')),
      body: SfTreemap.dice(
        dataCount: _data.length,
        weightValueMapper: (int index) => _data[index].populationInMillions,
        tileHoverColor: Colors.yellow,
        onSelectionChanged: (TreemapTile tile) {
          return;
        },
        levels: [
          TreemapLevel(
            padding: EdgeInsets.all(15),
            groupMapper: (int index) => _data[index].country,
            color: Colors.blue,
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

class DiceHierarchicalHoverColorSample extends StatefulWidget {
  @override
  _DiceHierarchicalHoverColorSampleState createState() =>
      _DiceHierarchicalHoverColorSampleState();
}

class _DiceHierarchicalHoverColorSampleState
    extends State<DiceHierarchicalHoverColorSample> {
  late List<JobVacancyModel> _source;

  @override
  void initState() {
    _source = <JobVacancyModel>[
      JobVacancyModel(country: 'America', job: 'Sales', vacancy: 70),
      JobVacancyModel(
          country: 'America', job: 'Technical', group: 'Testers', vacancy: 35),
      JobVacancyModel(
          country: 'America',
          job: 'Technical',
          group: 'Developers',
          role: 'Windows',
          vacancy: 105),
      JobVacancyModel(
          country: 'America',
          job: 'Technical',
          group: 'Developers',
          role: 'Web',
          vacancy: 40),
      JobVacancyModel(country: 'America', job: 'Management', vacancy: 40),
      JobVacancyModel(country: 'America', job: 'Accounts', vacancy: 60),
      JobVacancyModel(
          country: 'India', job: 'Technical', group: 'Testers', vacancy: 25),
      JobVacancyModel(
          country: 'India',
          job: 'Technical',
          group: 'Developers',
          role: 'Windows',
          vacancy: 155),
      JobVacancyModel(
          country: 'India',
          job: 'Technical',
          group: 'Developers',
          role: 'Web',
          vacancy: 60),
      JobVacancyModel(
          country: 'Germany', job: 'Sales', group: 'Executive', vacancy: 30),
      JobVacancyModel(
          country: 'Germany', job: 'Sales', group: 'Analyst', vacancy: 40),
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
        title: Text('Slice Hover'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: SfTreemap.dice(
                dataCount: _source.length,
                weightValueMapper: (int index) {
                  return _source[index].vacancy;
                },
                tileHoverColor: Colors.yellow,
                onSelectionChanged: (TreemapTile tile) {},
                levels: [
                  TreemapLevel(
                    color: Colors.pink,
                    padding: EdgeInsets.all(2.5),
                    groupMapper: (int index) => _source[index].country,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                        child: Text(tile.group),
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Colors.lime,
                    padding: EdgeInsets.all(10.0),
                    groupMapper: (int index) => _source[index].job!,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                        child: Text(tile.group),
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Colors.blue,
                    padding: EdgeInsets.all(15.0),
                    groupMapper: (int index) {
                      return _source[index].group;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                        child: Text(tile.group),
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Colors.green,
                    padding: EdgeInsets.all(15.0),
                    groupMapper: (int index) {
                      return _source[index].role;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                        child: Text(tile.group),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JobVacancyModel {
  const JobVacancyModel(
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
