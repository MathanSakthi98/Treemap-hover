import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class EqualColorMappingTestingSample extends StatefulWidget {
  @override
  _EqualColorMappingTestingSampleState createState() =>
      _EqualColorMappingTestingSampleState();
}

class _EqualColorMappingTestingSampleState
    extends State<EqualColorMappingTestingSample> {
  late List<PopulationStatus> _population;
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
    _population = const <PopulationStatus>[
      PopulationStatus('Andaman and Nicobar', 417036, 'low'),
      PopulationStatus('Andhra Pradesh', 49386799, 'medium'),
      PopulationStatus('Arunachal Pradesh', 1382611, 'medium'),
      PopulationStatus('Assam', 31169272, 'low'),
      PopulationStatus('Bihar', 103804637, 'high'),
      PopulationStatus('Chandigarh', 25540196, 'medium'),
      PopulationStatus('Chhattisgarh', 29436231, 'high'),
      PopulationStatus('Dadra and Nagar Haveli', 615724, 'low'),
      PopulationStatus('Daman and Diu', 615724, 'low'),
      PopulationStatus('Delhi', 18710922, 'medium'),
      PopulationStatus('Goa', 1457723, 'medium'),
      PopulationStatus('Gujarat', 60383628, 'high'),
      PopulationStatus('Haryana', 25353081, 'medium'),
      PopulationStatus('Madhya Pradesh', 72597565, 'high'),
      PopulationStatus('Rajasthan', 68621012, 'high'),
      PopulationStatus('Sikkim', 1091014, 'low'),
      PopulationStatus('Tripura', 3671032, 'medium'),
      PopulationStatus('Uttaranchal', 10116752, 'low'),
      PopulationStatus('West Bengal', 91347736, 'high'),
    ];

    _colorMappers = [
      TreemapColorMapper.value(value: 'low', color: Colors.blue[200]!),
      TreemapColorMapper.value(value: 'medium', color: Colors.blue[700]!),
      TreemapColorMapper.value(value: 'high', color: Colors.blue[900]!),
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
        title: Text('Range color mapper sample'),
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
                  _population[index].populationUpdate.toDouble(),
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
                  return _population[index].stateName;
                }, colorValueMapper: (TreemapTile tile) {
                  return _population[tile.indices[0]].density;
                })
              ])),
    );
  }
}

class PopulationStatus {
  const PopulationStatus(this.stateName, this.populationUpdate, this.density);

  final String stateName;

  final double populationUpdate;

  final String density;
}
