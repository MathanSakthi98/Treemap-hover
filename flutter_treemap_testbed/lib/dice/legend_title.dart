import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class DiceFlatWithDefaultLegendTitle extends StatefulWidget {
  @override
  _DiceFlatWithDefaultLegendTitleState createState() =>
      _DiceFlatWithDefaultLegendTitleState();
}

class _DiceFlatWithDefaultLegendTitleState
    extends State<DiceFlatWithDefaultLegendTitle> {
  late List<Population> _source;
  bool _hasLegendTop = true;
  bool _hasLegendLeft = false;
  bool _hasLegendRight = false;
  bool _hasLegendBottom = false;
  late TreemapLegendPosition _treemapLegendPosition;

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
    _hasLegendTop = true;
    _hasLegendLeft = false;
    _hasLegendRight = false;
    _hasLegendBottom = false;
    _treemapLegendPosition = TreemapLegendPosition.top;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slice Treemap legend')),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
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
                              _treemapLegendPosition =
                                  TreemapLegendPosition.top;
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
                            _treemapLegendPosition =
                                TreemapLegendPosition.right;
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
                          _treemapLegendPosition = TreemapLegendPosition.bottom;
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
                          _treemapLegendPosition = TreemapLegendPosition.left;
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
          ],
        ),
      ),
      body: SfTreemap.dice(
        dataCount: _source.length,
        weightValueMapper: (int index) {
          return _source[index].populationInMillions;
        },
        levels: [
          TreemapLevel(
            padding: EdgeInsets.only(left: 2.5, right: 2.5),
            groupMapper: (int index) {
              return _source[index].continent;
            },
            color: Colors.teal,
          ),
        ],
        legend: TreemapLegend(
          position: _treemapLegendPosition,
          title: Align(
            alignment: Alignment.center,
            child: Text('Legend title',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    backgroundColor: Colors.lime)),
          ),
        ),
      ),
    );
  }
}

class Population {
  const Population(this.continent, this.country, this.populationInMillions);

  final String country;
  final String continent;
  final double populationInMillions;
}
