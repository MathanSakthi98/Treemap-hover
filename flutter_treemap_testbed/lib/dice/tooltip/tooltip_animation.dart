import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class DiceTreemapTooltipAnimationSample extends StatefulWidget {
  @override
  _DiceTreemapTooltipAnimationSampleState createState() =>
      _DiceTreemapTooltipAnimationSampleState();
}

class _DiceTreemapTooltipAnimationSampleState
    extends State<DiceTreemapTooltipAnimationSample> {
  late List<OnlineMarketDataModel> _onlineMarketSource;

  @override
  void initState() {
    _onlineMarketSource = <OnlineMarketDataModel>[
      OnlineMarketDataModel(
          country: 'USA', name: 'Amazon', visitorsInBillions: 5.7),
      OnlineMarketDataModel(
          country: 'Japan', name: 'PayPay Mall', visitorsInBillions: 2.1),
      OnlineMarketDataModel(
          country: 'USA', name: 'eBay', visitorsInBillions: 1.6),
      OnlineMarketDataModel(
          country: 'South America',
          name: 'Mercado Libre',
          visitorsInBillions: 0.6617),
      OnlineMarketDataModel(
          country: 'China', name: 'AliExpress', visitorsInBillions: 0.6391),
      OnlineMarketDataModel(
          country: 'Japan', name: 'Rakuten', visitorsInBillions: 0.6215),
      OnlineMarketDataModel(
          country: 'China', name: 'Taobao', visitorsInBillions: 0.5452),
      OnlineMarketDataModel(
          country: 'USA', name: 'Walmart.com', visitorsInBillions: 0.469),
      OnlineMarketDataModel(
          country: 'China', name: 'JD.com', visitorsInBillions: 0.3182),
      OnlineMarketDataModel(
          country: 'USA', name: 'Etsy', visitorsInBillions: 0.2663),
    ];

    super.initState();
  }

  @override
  void dispose() {
    _onlineMarketSource.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Tooltip Animation Sample'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: SfTreemap.dice(
                dataCount: _onlineMarketSource.length,
                weightValueMapper: (int index) {
                  return _onlineMarketSource[index].visitorsInBillions;
                },
                tooltipSettings: TreemapTooltipSettings(
                    color: Colors.black,
                    borderColor: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                levels: [
                  TreemapLevel(
                    color: Colors.grey[200],
                    padding: EdgeInsets.all(2.0),
                    groupMapper: (int index) => _onlineMarketSource[index].name,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                        child: Text(tile.group),
                      ));
                    },
                    colorValueMapper: (TreemapTile tile) {
                      switch (_onlineMarketSource[tile.indices[0]].country) {
                        case 'USA':
                          return Color.fromRGBO(71, 94, 209, 1.0);
                        case 'Japan':
                          return Color.fromRGBO(236, 105, 85, 1.0);
                        case 'South America':
                          return Color.fromRGBO(78, 198, 125, 1.0);
                        case 'China':
                          return Color.fromRGBO(240, 140, 86, 1.0);
                      }
                    },
                    tooltipBuilder: (BuildContext context, TreemapTile tile) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          tile.group,
                          style: TextStyle(color: Colors.white),
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

class OnlineMarketDataModel {
  const OnlineMarketDataModel({
    required this.country,
    required this.name,
    required this.visitorsInBillions,
  });

  final String country;
  final String name;
  final double visitorsInBillions;
}
