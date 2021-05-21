import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class TooltipDiceSample extends StatefulWidget {
  @override
  _TooltipDiceSampleState createState() => _TooltipDiceSampleState();
}

class _TooltipDiceSampleState extends State<TooltipDiceSample> {
  late List<TreemapModel> _source;

  @override
  void initState() {
    _source = <TreemapModel>[
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
      TreemapModel(
          country: 'Germany', job: 'Sales', group: 'Executive', vacancy: 30),
      TreemapModel(
          country: 'Germany', job: 'Sales', group: 'Analyst', vacancy: 40),
      TreemapModel(
          country: 'UK',
          job: 'Technical',
          group: 'Developers',
          role: 'Windows',
          vacancy: 100),
      TreemapModel(
          country: 'UK',
          job: 'Technical',
          group: 'Developers',
          role: 'Web',
          vacancy: 30),
      TreemapModel(country: 'UK', job: 'HR Executives', vacancy: 60),
      TreemapModel(country: 'UK', job: 'Marketing', vacancy: 40),
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
        title: Text('Dice tooltip sample'),
      ),
      body: SfTreemap.dice(
        dataCount: _source.length,
        weightValueMapper: (int index) {
          return _source[index].vacancy;
        },
        tooltipSettings: TreemapTooltipSettings(
            color: Colors.black,
            borderColor: Colors.green[400],
            borderWidth: 3.0,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        levels: [
          TreemapLevel(
            color: Color.fromARGB(205, 158, 57, 118),
            padding: EdgeInsets.all(3.0),
            groupMapper: (int index) => _source[index].country,
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return IgnorePointer(
                child: Text(
                  '${tile.group} \ncount : ${tile.weight}',
                  softWrap: false,
                ),
              );
            },
          ),
          TreemapLevel(
            color: Color.fromARGB(255, 226, 136, 99),
            padding: EdgeInsets.all(3.0),
            groupMapper: (int index) => _source[index].job,
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return IgnorePointer(
                child: Text(
                  '${tile.group} \ncount : ${tile.weight}',
                  softWrap: false,
                ),
              );
            },
            tooltipBuilder: (BuildContext context, TreemapTile tile) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${tile.group} \nvacancy : ${tile.weight}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
          TreemapLevel(
            color: Color.fromARGB(255, 237, 194, 136),
            padding: EdgeInsets.all(3.0),
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return IgnorePointer(
                  child: Text(
                '${tile.group} \ncount : ${tile.weight}',
                softWrap: false,
              ));
            },
            groupMapper: (int index) {
              return _source[index].group;
            },
            tooltipBuilder: (BuildContext context, TreemapTile tile) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${tile.group} \nvacancy : ${tile.weight}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
          TreemapLevel(
            color: Color.fromARGB(255, 252, 253, 193),
            padding: EdgeInsets.all(5.0),
            groupMapper: (int index) {
              return _source[index].role;
            },
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return IgnorePointer(
                child: Text(
                  '${tile.group} \ncount : ${tile.weight}',
                  softWrap: false,
                ),
              );
            },
            tooltipBuilder: (BuildContext context, TreemapTile tile) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${tile.group} \nvacancy : ${tile.weight}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
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
