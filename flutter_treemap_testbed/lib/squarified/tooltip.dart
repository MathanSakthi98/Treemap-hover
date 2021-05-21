import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class SquarifiedTreemapTooltipSample extends StatefulWidget {
  @override
  _SquarifiedTreemapTooltipSampleState createState() =>
      _SquarifiedTreemapTooltipSampleState();
}

class _SquarifiedTreemapTooltipSampleState
    extends State<SquarifiedTreemapTooltipSample> {
  late List<FoodDataModel> _source;

  @override
  void initState() {
    _source = <FoodDataModel>[
      FoodDataModel(
          brunch: 'Breakfast',
          type: 'Beverage',
          food: 'Coffee',
          price: 2.0,
          quantity: 10),
      FoodDataModel(
          brunch: 'Breakfast',
          type: 'Beverage',
          food: 'Tea',
          price: 3.0,
          quantity: 3),
      FoodDataModel(
          brunch: 'Breakfast',
          type: 'Food',
          food: 'Waffles',
          price: 6.0,
          quantity: 2),
      FoodDataModel(
          brunch: 'Breakfast',
          type: 'Food',
          food: 'Pancakes',
          price: 5.0,
          quantity: 7),
      FoodDataModel(
          brunch: 'Breakfast',
          type: 'Food',
          food: 'Eggs',
          price: 6.0,
          quantity: 4),
      FoodDataModel(
          brunch: 'Lunch',
          type: 'Beverage',
          food: 'Coffee',
          price: 2.0,
          quantity: 5),
      FoodDataModel(
          brunch: 'Lunch',
          type: 'Beverage',
          food: 'Iced tea',
          price: 3.0,
          quantity: 15),
      FoodDataModel(
          brunch: 'Lunch', type: 'Food', food: 'soup', price: 4.0, quantity: 4),
      FoodDataModel(
          brunch: 'Lunch',
          type: 'Food',
          food: 'Sandwich',
          price: 6.0,
          quantity: 6),
      FoodDataModel(
          brunch: 'Lunch',
          type: 'Food',
          food: 'salad',
          price: 7.0,
          quantity: 10),
      FoodDataModel(
          brunch: 'Lunch',
          type: 'Food',
          food: 'Chicken',
          price: 3.0,
          quantity: 15),
      FoodDataModel(
          brunch: 'Lunch',
          type: 'Food',
          food: 'cookie',
          price: 1.0,
          quantity: 25),
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
        title: Text('Squarified Tooltip Sample'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: SfTreemap(
                dataCount: _source.length,
                weightValueMapper: (int index) {
                  return _source[index].price!;
                },
                tooltipSettings: TreemapTooltipSettings(
                    color: Colors.black,
                    borderColor: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                levels: [
                  TreemapLevel(
                    color: Colors.red,
                    padding: EdgeInsets.all(0),
                    border: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                    groupMapper: (int index) => _source[index].brunch,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                          child: Text(tile.group),
                        ),
                      );
                    },
                    tooltipBuilder: (BuildContext context, TreemapTile tile) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          tile.group,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Colors.green,
                    padding: EdgeInsets.all(5),
                    border: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                        child: Text(
                          '${tile.group}\nPrice : \$${tile.weight}',
                        ),
                      );
                    },
                    groupMapper: (int index) => _source[index].food!,
                    tooltipBuilder: (BuildContext context, TreemapTile tile) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${tile.group} \nPrice : \$${tile.weight}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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

class FoodDataModel {
  const FoodDataModel(
      {required this.brunch,
      this.type,
      this.food,
      this.price,
      required this.quantity});
  final String brunch;
  final String? type;
  final String? food;
  final double? price;
  final double quantity;
}
