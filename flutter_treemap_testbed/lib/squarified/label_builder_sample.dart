import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class LabelBuilderSample extends StatefulWidget {
  @override
  _LabelBuilderSampleState createState() => _LabelBuilderSampleState();
}

class _LabelBuilderSampleState extends State<LabelBuilderSample> {
  late List<CarDataModel> _data;

  @override
  void initState() {
    _data = <CarDataModel>[
      CarDataModel(brand: 'Maruti Suzuki', model: 'Alto 800', count: 100),
      CarDataModel(brand: 'Maruti Suzuki', model: 'WagonR', count: 100),
      CarDataModel(brand: 'Maruti Suzuki', model: 'Swift', count: 100),
      CarDataModel(brand: 'Maruti Suzuki', model: 'Ignis', count: 100),
      CarDataModel(brand: 'Maruti Suzuki', model: 'Baleno', count: 100),
      CarDataModel(brand: 'Maruti Suzuki', model: 'Swift Dzire', count: 100),
      CarDataModel(brand: 'Hyundai', model: 'Santro', count: 100),
      CarDataModel(brand: 'Hyundai', model: 'Verna', count: 100),
      CarDataModel(brand: 'Hyundai', model: 'Grand i10', count: 100),
      CarDataModel(brand: 'Hyundai', model: 'Elite i20', count: 100),
      CarDataModel(brand: 'Hyundai', model: 'Creta', count: 100),
      CarDataModel(brand: 'Hyundai', model: 'Elantra', count: 100),
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
      appBar: AppBar(
        title: Text('Squarified Label Builder'),
      ),
      body: SfTreemap(
        dataCount: _data.length,
        weightValueMapper: (int index) {
          return _data[index].count;
        },
        onSelectionChanged: (TreemapTile tile) {
          // print('tile.group is selected');
        },
        levels: [
          TreemapLevel(
            color: Colors.pink[300],
            padding: EdgeInsets.all(5.0),
            groupMapper: (int index) => _data[index].brand,
            border: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 2),
            ),
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return IgnorePointer(
                child: Container(
                  child: Text(
                    'Brand : ${tile.group}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.yellow),
                  ),
                ),
              );
            },
          ),
          TreemapLevel(
            color: Colors.orange[300],
            padding: EdgeInsets.all(5.0),
            border: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2)),
            groupMapper: (int index) => _data[index].model,
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return IgnorePointer(
                child: Text(
                  '${tile.group} \nCost : ${tile.weight.toInt()} INR',
                  style: TextStyle(backgroundColor: Colors.yellow),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CarDataModel {
  const CarDataModel(
      {required this.brand, required this.model, required this.count});
  final String brand;
  final String model;
  final double count;
}
