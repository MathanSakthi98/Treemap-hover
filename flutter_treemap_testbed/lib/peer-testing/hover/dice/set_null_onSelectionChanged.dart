import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class DynamicOnSelectionChanged extends StatefulWidget {
  _DynamicOnSelectionChangedState createState() =>
      _DynamicOnSelectionChangedState();
}

class _DynamicOnSelectionChangedState extends State<DynamicOnSelectionChanged> {
  late List<TreemapModel> _data;
  bool _enableSelection = true;
  bool _checkBoxValue = true;

  @override
  void initState() {
    _data = <TreemapModel>[
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
    return Scaffold(
      appBar: AppBar(title: Text('Set null onSelectionChanged')),
      body: Column(
        children: [
          Container(
            height: 500,
            child: SfTreemap.dice(
              dataCount: _data.length,
              weightValueMapper: (int index) => _data[index].vacancy,
              onSelectionChanged:
                  _enableSelection ? (TreemapTile tile) {} : null,
              levels: [
                TreemapLevel(
                    padding: EdgeInsets.all(5),
                    groupMapper: (int index) => _data[index].country,
                    color: Colors.green,
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
                    groupMapper: (int index) => _data[index].job,
                    color: Colors.blue,
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
                  groupMapper: (int index) => _data[index].group,
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          Checkbox(
            value: _checkBoxValue,
            onChanged: (bool? newValue) {
              setState(() {
                _checkBoxValue = newValue!;
                _enableSelection = newValue;
              });
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
