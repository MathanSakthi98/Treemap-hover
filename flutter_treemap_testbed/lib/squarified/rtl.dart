import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

import '../main.dart';

class SquarifiedRTLFlatSample extends StatefulWidget {
  @override
  _SquarifiedRTLFlatSampleState createState() =>
      _SquarifiedRTLFlatSampleState();
}

class _SquarifiedRTLFlatSampleState extends State<SquarifiedRTLFlatSample> {
  late List<Population> _source;
  bool _isRTL = false;

  @override
  void initState() {
    _source = <Population>[
      Population('Asia', 'Thailand', 7.54),
      Population('Africa', 'South Africa', 25.4),
      Population('North America', 'Canada', 13.3),
      Population('South America', 'Chile', 19.11),
      Population('Australia', 'New Zealand', 4.93),
      Population('Europe', 'Czech Republic', 10.65),
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
        title: Text('RTL sample'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Directionality(
              textDirection: _isRTL ? TextDirection.rtl : TextDirection.ltr,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 2.5, top: 5.0, right: 2.5, bottom: 5.0),
                child: SfTreemap(
                  dataCount: _source.length,
                  weightValueMapper: (int index) {
                    return _source[index].populationInMillions;
                  },
                  levels: [
                    TreemapLevel(
                      groupMapper: (int index) {
                        return _source[index].continent;
                      },
                      border: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          side: BorderSide(width: 2.0, color: Colors.black)),
                      labelBuilder: (BuildContext context, TreemapTile tile) {
                        return Text(
                          'Continent : ${tile.group}',
                          style: TextStyle(color: getTextColor(tile.color)),
                        );
                      },
                      itemBuilder: (BuildContext context, TreemapTile tile) {
                        return Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.text_snippet),
                        );
                      },
                      tooltipBuilder: (BuildContext context, TreemapTile tile) {
                        return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            tile.group,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      },
                    ),
                    TreemapLevel(
                      groupMapper: (int index) {
                        return _source[index].country;
                      },
                      padding: EdgeInsets.all(4.0),
                      border: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          side: BorderSide(width: 2.0, color: Colors.black)),
                      labelBuilder: (BuildContext context, TreemapTile tile) {
                        return Text(
                          'Continent : ${tile.group}',
                          style: TextStyle(color: getTextColor(tile.color)),
                        );
                      },
                      itemBuilder: (BuildContext context, TreemapTile tile) {
                        return Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.textsms),
                        );
                      },
                      tooltipBuilder: (BuildContext context, TreemapTile tile) {
                        return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            tile.group,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      },
                    ),
                  ],
                  legend: TreemapLegend.bar(
                    position: TreemapLegendPosition.bottom,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _isRTL,
                onChanged: (bool? value) {
                  setState(() {
                    _isRTL = value!;
                  });
                },
              ),
              Text('RTL')
            ],
          )
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
