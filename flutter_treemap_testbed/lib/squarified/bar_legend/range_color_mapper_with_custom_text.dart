import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class RangeColorMapperCustomTextSample extends StatefulWidget {
  @override
  _RangeColorMapperCustomTextSampleState createState() =>
      _RangeColorMapperCustomTextSampleState();
}

class _RangeColorMapperCustomTextSampleState
    extends State<RangeColorMapperCustomTextSample> {
  late List<PopulationData> _population;
  late bool _hasLegendTop;
  late bool _hasLegendLeft;
  late bool _hasLegendRight;
  late bool _hasLegendBottom;
  late bool _isOnTicks;
  late bool _isOnBetweenTicks;
  late bool _isInsideLabel;
  late bool _isNoneLabel;
  late bool _isRTL;
  late bool _isHide;
  late bool _isEllipsis;
  late bool _isVisible;
  late bool _isEnableGradient;
  late TreemapLegendPosition _legendPosition;
  late TreemapLegendLabelsPlacement _labelPlacement;
  late TreemapLegendEdgeLabelsPlacement _edgeLabelPlacement;
  late TextDirection _textDirection;
  late TreemapLabelOverflow _labelOverflowMode;
  late List<TreemapColorMapper> _colorMappers;

  @override
  void initState() {
    _population = <PopulationData>[
      PopulationData('Carlow', 54612),
      PopulationData('Dublin', 1273069),
      PopulationData('Kildare', 210312),
      PopulationData('Kilkenny', 95419),
      PopulationData('Laoighis', 80599),
      PopulationData('Longford', 39000),
      PopulationData('Louth', 122897),
      PopulationData('Meath', 184135),
      PopulationData('Offaly', 76867),
      PopulationData('Westmeath', 86164),
      PopulationData('Wexford', 145320),
      PopulationData('Wicklow', 136640),
      PopulationData('Clare', 117196),
      PopulationData('Cork', 519032),
      PopulationData('Kerry', 145512),
      PopulationData('Limerick', 191809),
      PopulationData('Tipperary', 158754),
      PopulationData('Waterford', 113795),
      PopulationData('Galway', 250653),
      PopulationData('Leitrim', 31798),
      PopulationData('Mayo', 130638),
      PopulationData('Roscommon', 64065),
      PopulationData('Sligo', 65393),
      PopulationData('Cavan', 73183),
      PopulationData('Donegal', 161137),
      PopulationData('Monaghan', 60483),
    ];

    _colorMappers = [
      TreemapColorMapper.range(
          from: 0,
          to: 8,
          color: Colors.blue[200]!,
          name: '{Lowest population},{}'),
      TreemapColorMapper.range(
          from: 8, to: 25, color: Colors.blue[400]!, name: ''),
      TreemapColorMapper.range(
          from: 25, to: 55, color: Colors.blue[800]!, name: ''),
      TreemapColorMapper.range(
          from: 55,
          to: 155,
          color: Colors.blue[900]!,
          name: 'Highest population'),
    ];

    _legendPosition = TreemapLegendPosition.top;
    _labelPlacement = TreemapLegendLabelsPlacement.betweenItems;
    _edgeLabelPlacement = TreemapLegendEdgeLabelsPlacement.inside;
    _textDirection = TextDirection.ltr;
    _labelOverflowMode = TreemapLabelOverflow.ellipsis;
    _hasLegendTop = true;
    _hasLegendLeft = false;
    _hasLegendRight = false;
    _hasLegendBottom = false;
    _isOnTicks = false;
    _isOnBetweenTicks = true;
    _isInsideLabel = true;
    _isNoneLabel = false;
    _isRTL = false;
    _isHide = false;
    _isEllipsis = true;
    _isVisible = false;
    _isEnableGradient = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Range color mapper with custom text sample'),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
                height: 40.0,
                child: DrawerHeader(
                    padding: const EdgeInsets.fromLTRB(20, 7, 0, 0),
                    margin: const EdgeInsets.all(0),
                    child: const Text('Bar Legend type',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times')),
                    decoration: BoxDecoration(color: Colors.blue[300]))),
            Container(
              height: 40,
              child: ListTile(
                title: CheckboxListTile(
                    title: const Text('Enable gradient'),
                    value: _isEnableGradient,
                    onChanged: (bool? value) {
                      setState(() {
                        _isEnableGradient = value!;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 40.0,
                child: DrawerHeader(
                    padding: const EdgeInsets.fromLTRB(20, 7, 0, 0),
                    margin: const EdgeInsets.all(0),
                    child: const Text('Legend position',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times')),
                    decoration: BoxDecoration(color: Colors.blue[300]))),
            Container(
                height: 40,
                child: ListTile(
                    title: CheckboxListTile(
                        title: const Text('Top'),
                        value: _hasLegendTop,
                        onChanged: (bool? value) {
                          setState(() {
                            _hasLegendTop = value!;
                            if (_hasLegendTop) {
                              _legendPosition = TreemapLegendPosition.top;
                              _hasLegendRight = false;
                              _hasLegendLeft = false;
                              _hasLegendBottom = false;
                            }
                          });
                        }))),
            Container(
                height: 40,
                child: ListTile(
                  title: CheckboxListTile(
                      title: const Text('Right'),
                      value: _hasLegendRight,
                      onChanged: (bool? value) {
                        setState(() {
                          _hasLegendRight = value!;
                          if (_hasLegendRight) {
                            _legendPosition = TreemapLegendPosition.right;
                            _hasLegendTop = false;
                            _hasLegendLeft = false;
                            _hasLegendBottom = false;
                          }
                        });
                      }),
                )),
            Container(
              height: 40,
              child: ListTile(
                title: CheckboxListTile(
                    title: const Text('Bottom'),
                    value: _hasLegendBottom,
                    onChanged: (bool? value) {
                      setState(() {
                        _hasLegendBottom = value!;
                        if (_hasLegendBottom) {
                          _legendPosition = TreemapLegendPosition.bottom;
                          _hasLegendTop = false;
                          _hasLegendLeft = false;
                          _hasLegendRight = false;
                        }
                      });
                    }),
              ),
            ),
            Container(
              height: 40,
              child: ListTile(
                title: CheckboxListTile(
                    title: const Text('Left'),
                    value: _hasLegendLeft,
                    onChanged: (bool? value) {
                      setState(() {
                        _hasLegendLeft = value!;
                        if (_hasLegendLeft) {
                          _legendPosition = TreemapLegendPosition.left;
                          _hasLegendTop = false;
                          _hasLegendBottom = false;
                          _hasLegendRight = false;
                        }
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 40.0,
                child: DrawerHeader(
                    padding: const EdgeInsets.fromLTRB(20, 7, 0, 0),
                    margin: const EdgeInsets.all(0),
                    child: const Text('Label placement',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times')),
                    decoration: BoxDecoration(color: Colors.blue[300]))),
            Container(
              height: 40,
              child: ListTile(
                title: CheckboxListTile(
                    title: const Text('on tick'),
                    value: _isOnTicks,
                    onChanged: (bool? value) {
                      setState(() {
                        _isOnTicks = value!;
                        if (_isOnTicks) {
                          _labelPlacement = TreemapLegendLabelsPlacement.onItem;
                          _isOnBetweenTicks = false;
                        }
                      });
                    }),
              ),
            ),
            Container(
              height: 40,
              child: ListTile(
                title: CheckboxListTile(
                    title: const Text('on between ticks'),
                    value: _isOnBetweenTicks,
                    onChanged: (bool? value) {
                      setState(() {
                        _isOnBetweenTicks = value!;
                        if (_isOnBetweenTicks) {
                          _labelPlacement =
                              TreemapLegendLabelsPlacement.betweenItems;
                          _isOnTicks = false;
                        }
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 40.0,
                child: DrawerHeader(
                    padding: const EdgeInsets.fromLTRB(20, 7, 0, 0),
                    margin: const EdgeInsets.all(0),
                    child: const Text('Edge label placement',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times')),
                    decoration: BoxDecoration(color: Colors.blue[300]))),
            Container(
              height: 40,
              child: ListTile(
                title: CheckboxListTile(
                    title: const Text('inside'),
                    value: _isInsideLabel,
                    onChanged: (bool? value) {
                      setState(() {
                        _isInsideLabel = value!;
                        if (_isInsideLabel) {
                          _edgeLabelPlacement =
                              TreemapLegendEdgeLabelsPlacement.inside;
                          _isNoneLabel = false;
                        }
                      });
                    }),
              ),
            ),
            Container(
              height: 40,
              child: ListTile(
                title: CheckboxListTile(
                    title: const Text('center'),
                    value: _isNoneLabel,
                    onChanged: (bool? value) {
                      setState(() {
                        _isNoneLabel = value!;
                        if (_isNoneLabel) {
                          _edgeLabelPlacement =
                              TreemapLegendEdgeLabelsPlacement.center;
                          _isInsideLabel = false;
                        }
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 40.0,
                child: DrawerHeader(
                    padding: const EdgeInsets.fromLTRB(20, 7, 0, 0),
                    margin: const EdgeInsets.all(0),
                    child: const Text('Text Direction',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times')),
                    decoration: BoxDecoration(color: Colors.blue[300]))),
            Container(
              height: 40,
              child: ListTile(
                title: CheckboxListTile(
                    title: const Text('RTL'),
                    value: _isRTL,
                    onChanged: (bool? value) {
                      setState(() {
                        _isRTL = value!;
                        if (_isRTL) {
                          _textDirection = TextDirection.rtl;
                        } else {
                          _textDirection = TextDirection.ltr;
                        }
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 40.0,
                child: DrawerHeader(
                    padding: const EdgeInsets.fromLTRB(20, 7, 0, 0),
                    margin: const EdgeInsets.all(0),
                    child: const Text('Overflow mode',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times')),
                    decoration: BoxDecoration(color: Colors.blue[300]))),
            Container(
              height: 40,
              child: ListTile(
                title: CheckboxListTile(
                    title: const Text('ellipsis'),
                    value: _isEllipsis,
                    onChanged: (bool? value) {
                      setState(() {
                        _isEllipsis = value!;
                        if (_isEllipsis) {
                          _labelOverflowMode = TreemapLabelOverflow.ellipsis;
                          _isHide = false;
                          _isVisible = false;
                        }
                      });
                    }),
              ),
            ),
            Container(
              height: 40,
              child: ListTile(
                title: CheckboxListTile(
                    title: const Text('hide'),
                    value: _isHide,
                    onChanged: (bool? value) {
                      setState(() {
                        _isHide = value!;
                        if (_isHide) {
                          _labelOverflowMode = TreemapLabelOverflow.hide;
                          _isEllipsis = false;
                          _isVisible = false;
                        }
                      });
                    }),
              ),
            ),
            Container(
              height: 40,
              child: ListTile(
                title: CheckboxListTile(
                    title: const Text('visible'),
                    value: _isVisible,
                    onChanged: (bool? value) {
                      setState(() {
                        _isVisible = value!;
                        if (_isVisible) {
                          _labelOverflowMode = TreemapLabelOverflow.visible;
                          _isHide = false;
                          _isEllipsis = false;
                        }
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      body: Directionality(
          textDirection: _textDirection,
          child: SfTreemap(
              dataCount: _population.length,
              weightValueMapper: (int index) =>
                  _population[index].population.toDouble(),
              colorMappers: _colorMappers,
              legend: TreemapLegend.bar(
                segmentPaintingStyle: _isEnableGradient
                    ? TreemapLegendPaintingStyle.gradient
                    : TreemapLegendPaintingStyle.solid,
                position: _legendPosition,
                labelsPlacement: _labelPlacement,
                labelOverflow: _labelOverflowMode,
                edgeLabelsPlacement: _edgeLabelPlacement,
              ),
              levels: [
                TreemapLevel(groupMapper: (int index) {
                  return _population[index].key;
                }, colorValueMapper: (TreemapTile tile) {
                  return _population[tile.indices[0]].population / 10000;
                })
              ])),
    );
  }
}

class PopulationData {
  const PopulationData(this.key, this.population);

  final String key;

  final int population;
}
