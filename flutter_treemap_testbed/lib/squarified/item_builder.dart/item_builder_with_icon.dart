import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class IconItemBuilderSample extends StatefulWidget {
  @override
  _IconItemBuilderSampleState createState() => _IconItemBuilderSampleState();
}

class _IconItemBuilderSampleState extends State<IconItemBuilderSample> {
  late List<USGoldModelData> _source;

  @override
  void initState() {
    _source = <USGoldModelData>[
      USGoldModelData('Swimming', 16),
      USGoldModelData('Athletics', 13),
      USGoldModelData('Gymnastics', 4.0),
      USGoldModelData('Cycling', 2.0),
      USGoldModelData('Wrestling', 2.0),
      USGoldModelData('Boxing', 1.0),
      USGoldModelData('Tennis', 1.0),
      USGoldModelData('Basket ball', 2.0),
      USGoldModelData('Shooting', 1.0),
      USGoldModelData('Rowing', 1.0),
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
        title: Text('Item builder with text'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfTreemap(
              dataCount: _source.length,
              tooltipSettings: TreemapTooltipSettings(
                  color: Colors.black,
                  borderColor: Colors.white,
                  borderWidth: 1.0),
              weightValueMapper: (int index) {
                return _source[index].modelCount;
              },
              levels: [
                TreemapLevel(
                    padding: EdgeInsets.all(2),
                    groupMapper: (int index) {
                      return _source[index].game;
                    },
                    color: Color.fromRGBO(179, 0, 179, 1.0),
                    tooltipBuilder: (BuildContext context, TreemapTile tile) {
                      return Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          tile.group + ' : ' + tile.weight.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    itemBuilder: (BuildContext context, TreemapTile tile) {
                      switch (tile.group) {
                        case 'Basket ball':
                          return Icon(
                            Icons.sports_baseball,
                            color: Colors.white,
                          );
                        case 'Wrestling':
                          return Icon(
                            Icons.sports_kabaddi,
                            color: Colors.white,
                          );
                        case 'Boxing':
                          return Icon(
                            Icons.sports_mma,
                            color: Colors.white,
                          );
                        case 'Tennis':
                          return Icon(
                            Icons.sports_tennis,
                            color: Colors.white,
                          );
                        case 'Cycling':
                          return Icon(
                            Icons.motorcycle_sharp,
                            color: Colors.white,
                          );
                        case 'Swimming':
                          return Icon(
                            Icons.home_work,
                            color: Colors.white,
                          );
                        case 'Athletics':
                          return Icon(
                            Icons.hot_tub_rounded,
                            color: Colors.white,
                          );
                        case 'Gymnastics':
                          return Icon(
                            Icons.image_sharp,
                            color: Colors.white,
                          );
                        case 'Rowing':
                          return Icon(
                            Icons.inventory,
                            color: Colors.white,
                          );
                        case 'Shooting':
                          return Icon(
                            Icons.keyboard_voice,
                            color: Colors.white,
                          );
                        default:
                          return SizedBox();
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class USGoldModelData {
  const USGoldModelData(this.game, this.modelCount);

  final String game;
  final double modelCount;
}
