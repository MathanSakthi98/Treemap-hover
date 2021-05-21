import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class LabelBuilderDiceSample extends StatefulWidget {
  @override
  _LabelBuilderDiceSampleState createState() => _LabelBuilderDiceSampleState();
}

class _LabelBuilderDiceSampleState extends State<LabelBuilderDiceSample> {
  late List<PetDataModel> _source;

  @override
  void initState() {
    _source = <PetDataModel>[
      PetDataModel(group: 'Bird', name: 'Charlie', count: 5),
      PetDataModel(group: 'Bird', name: 'Angel', count: 3),
      PetDataModel(group: 'Bird', name: 'Pikachu', count: 8),
      PetDataModel(group: 'Bird', name: 'Coco', count: 6),
      PetDataModel(
          group: 'mammals', name: 'dog', type: 'German Shepherd', count: 4),
      PetDataModel(group: 'mammals', name: 'dog', type: 'Labrador', count: 1),
      PetDataModel(
          group: 'mammals', name: 'dog', type: 'Golden Retriever', count: 4),
      PetDataModel(group: 'mammals', name: 'cat', count: 8),
      PetDataModel(group: 'mammals', name: 'rabbit', count: 5),
      PetDataModel(group: 'Fish', name: 'Goldfish', count: 10),
      PetDataModel(group: 'Fish', name: 'Cat fish', count: 3),
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
        title: Text('Dice label builder sample'),
      ),
      body: SfTreemap.dice(
        dataCount: _source.length,
        weightValueMapper: (int index) {
          return _source[index].count;
        },
        levels: [
          TreemapLevel(
            color: Colors.pink[300],
            border:
                RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
            groupMapper: (int index) => _source[index].group,
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return IgnorePointer(
                  child: Container(
                child: Text(
                  '${tile.group} count : ${tile.weight}',
                ),
              ));
            },
          ),
          TreemapLevel(
            color: Colors.orange[300],
            padding: EdgeInsets.all(2.0),
            border:
                RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
            groupMapper: (int index) => _source[index].name,
            tooltipBuilder: (BuildContext context, TreemapTile tile) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${tile.group} \n vacancy : ${tile.weight}',
                  ),
                ),
              );
            },
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return IgnorePointer(
                child: Container(
                  child: Text(
                    '${tile.group} count : ${tile.weight}',
                  ),
                ),
              );
            },
          ),
          TreemapLevel(
            color: Colors.grey,
            padding: EdgeInsets.all(2.0),
            border:
                RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
            groupMapper: (int index) {
              return _source[index].type;
            },
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return IgnorePointer(
                child: Container(
                  child: Text(
                    '${tile.group} count : ${tile.weight}',
                  ),
                ),
              );
            },
            tooltipBuilder: (BuildContext context, TreemapTile tile) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${tile.group} \n vacancy : ${tile.weight}',
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

class PetDataModel {
  const PetDataModel(
      {required this.group, this.name, this.type, required this.count});
  final String group;
  final String? name;
  final String? type;
  final double count;
}
