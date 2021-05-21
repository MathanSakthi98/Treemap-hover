import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class LabelBuilderSquarifiedSample extends StatefulWidget {
  @override
  _LabelBuilderSquarifiedSampleState createState() =>
      _LabelBuilderSquarifiedSampleState();
}

class _LabelBuilderSquarifiedSampleState
    extends State<LabelBuilderSquarifiedSample> {
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
      CarDataModel(brand: 'Mahindra', model: 'XUV300', count: 100),
      CarDataModel(brand: 'Mahindra', model: 'Thar', count: 100),
      CarDataModel(brand: 'Mahindra', model: 'Scorpio', count: 100),
      CarDataModel(brand: 'Mahindra', model: 'Bolero', count: 100),
      CarDataModel(brand: 'Mahindra', model: 'XUV500', count: 100),
      CarDataModel(brand: 'Mahindra', model: 'Marazzo', count: 100),
      CarDataModel(brand: 'Tata Motors', model: 'Nexon', count: 100),
      CarDataModel(brand: 'Tata Motors', model: 'Tiago', count: 100),
      CarDataModel(brand: 'Tata Motors', model: 'Tigor', count: 100),
      CarDataModel(brand: 'Tata Motors', model: 'Harrier', count: 100),
      CarDataModel(brand: 'Tata Motors', model: 'Altroz', count: 100),
      CarDataModel(brand: 'Honda', model: 'Accord', count: 100),
      CarDataModel(brand: 'Honda', model: 'City', count: 100),
      CarDataModel(brand: 'Honda', model: 'Civic', count: 100),
      CarDataModel(brand: 'Honda', model: 'Jazz', count: 100),
      CarDataModel(brand: 'Honda', model: 'BR-V', count: 100),
      CarDataModel(brand: 'Toyota', model: 'Corolla Altis', count: 100),
      CarDataModel(brand: 'Toyota', model: 'Fortuner', count: 100),
      CarDataModel(brand: 'Toyota', model: 'Innova Crysta', count: 100),
      CarDataModel(brand: 'Toyota', model: 'Yaris', count: 100),
      CarDataModel(brand: 'Toyota', model: 'Etios Liva', count: 100),
      CarDataModel(brand: 'Toyota', model: 'Etios Cross', count: 100),
      CarDataModel(brand: 'Ford', model: 'EcoSport', count: 100),
      CarDataModel(brand: 'Ford', model: 'Figo', count: 100),
      CarDataModel(brand: 'Ford', model: 'Endeavour', count: 100),
      CarDataModel(brand: 'Ford', model: 'Freestyle', count: 100),
      CarDataModel(brand: 'Ford', model: 'Aspire', count: 100),
      CarDataModel(brand: 'Renault', model: 'KWID', count: 100),
      CarDataModel(brand: 'Renault', model: 'TRIBER', count: 100),
      CarDataModel(brand: 'Renault', model: 'Duster', count: 100),
      CarDataModel(brand: 'Renault', model: 'CAPTUR', count: 100),
      CarDataModel(brand: 'Renault', model: 'Lodgy', count: 100),
      CarDataModel(brand: 'Nisson', model: 'Micra Active', count: 100),
      CarDataModel(brand: 'Nisson', model: 'Terrano', count: 100),
      CarDataModel(brand: 'Nisson', model: 'Sunny', count: 100),
      CarDataModel(brand: 'Nisson', model: 'GTR', count: 100),
      CarDataModel(brand: 'Volkswagen', model: 'Polo', count: 100),
      CarDataModel(brand: 'Volkswagen', model: 'Vento', count: 100),
      CarDataModel(brand: 'Volkswagen', model: 'T-Roc', count: 100),
      CarDataModel(brand: 'Volkswagen', model: 'Tiguan Allspace', count: 100),
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
            padding: EdgeInsets.all(3.0),
            groupMapper: (int index) => _data[index].brand,
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return IgnorePointer(
                child: Container(
                  child: Text(
                    'Brand : ${tile.group}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
          TreemapLevel(
            color: Colors.orange[300],
            padding: EdgeInsets.all(1.0),
            border: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blueGrey)),
            groupMapper: (int index) => _data[index].model,
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return IgnorePointer(
                child: Center(
                  child: Text(
                    '${tile.group} \nCost : ${tile.weight.toInt()} INR',
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

class CarDataModel {
  const CarDataModel(
      {required this.brand, required this.model, required this.count});
  final String brand;
  final String model;
  final double count;
}
