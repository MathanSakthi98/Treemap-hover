import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class WithGestureDetector extends StatefulWidget {
  _WithGestureDetectorState createState() => _WithGestureDetectorState();
}

class _WithGestureDetectorState extends State<WithGestureDetector> {
  late List<TreemapModel> _data;
  bool _opaque = true;

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
      appBar: AppBar(title: Text('Update hover dynamically')),
      body: Column(
        children: [
          Container(
            height: 500,
            child: SfTreemap.slice(
              dataCount: _data.length,
              weightValueMapper: (int index) => _data[index].vacancy,
              onSelectionChanged: (TreemapTile tile) {},
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
                    padding: EdgeInsets.all(10),
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
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTapUp: (TapUpDetails details) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text('Gesture tapped')),
                            ),
                          );
                        },
                        child: Text(tile.group),
                      );
                    }),
              ],
            ),
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
