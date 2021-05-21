import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

import '../main.dart';

class HierarchicalDiceSample extends StatefulWidget {
  @override
  _HierarchicalDiceSampleState createState() => _HierarchicalDiceSampleState();
}

class _HierarchicalDiceSampleState extends State<HierarchicalDiceSample> {
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
      // TreemapModel(
      //     country: 'Germany', job: 'Sales', group: 'Executive', vacancy: 30),
      // TreemapModel(
      //     country: 'Germany', job: 'Sales', group: 'Analyst', vacancy: 40),
      // TreemapModel(
      //     country: 'UK',
      //     job: 'Technical',
      //     group: 'Developers',
      //     role: 'Windows',
      //     vacancy: 100),
      // TreemapModel(
      //     country: 'UK',
      //     job: 'Technical',
      //     group: 'Developers',
      //     role: 'Web',
      //     vacancy: 30),
      // TreemapModel(country: 'UK', job: 'HR Executives', vacancy: 60),
      // TreemapModel(country: 'UK', job: 'Marketing', vacancy: 40),
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
    final RoundedRectangleBorder border = RoundedRectangleBorder(
      side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice hierarchical level'),
      ),
      body: SfTreemap.dice(
        dataCount: _source.length,
        weightValueMapper: (int index) {
          return _source[index].vacancy;
        },
        levels: [
          TreemapLevel(
            groupMapper: (int index) => _source[index].country,
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return Text(
                '${tile.group} \n vacancy : ${tile.weight}',
                textAlign: TextAlign.center,
                style: TextStyle(color: getTextColor(tile.color)),
              );
            },
          ),
          TreemapLevel(
            border: border,
            groupMapper: (int index) => _source[index].job,
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return Text(
                '${tile.group} \n vacancy : ${tile.weight}',
                textAlign: TextAlign.center,
                style: TextStyle(color: getTextColor(tile.color)),
              );
            },
          ),
          TreemapLevel(
            border: border,
            groupMapper: (int index) {
              return _source[index].group;
            },
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return Text(
                '${tile.group} \n vacancy : ${tile.weight}',
                textAlign: TextAlign.center,
                style: TextStyle(color: getTextColor(tile.color)),
              );
            },
          ),
          TreemapLevel(
            border: border,
            groupMapper: (int index) {
              return _source[index].role;
            },
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return Text(
                '${tile.group} \n vacancy : ${tile.weight}',
                textAlign: TextAlign.center,
                style: TextStyle(color: getTextColor(tile.color)),
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
