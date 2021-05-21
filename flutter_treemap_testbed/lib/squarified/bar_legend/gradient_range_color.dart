import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class RangeColorGradientSample extends StatefulWidget {
  @override
  _RangeColorGradientSampleState createState() =>
      _RangeColorGradientSampleState();
}

class _RangeColorGradientSampleState extends State<RangeColorGradientSample> {
  late List<IcelandPopulation> _population;

  @override
  void initState() {
    _population = <IcelandPopulation>[
      IcelandPopulation('Reykh�lahreppur', 54612, 'Value 1'),
      IcelandPopulation('�safjar�arb�r', 473069, 'Value 2'),
      IcelandPopulation('Sveitarf�lagi� Hornafj�r�ur', 210312, 'Value 3'),
      IcelandPopulation('Austurland', 95419, 'Value 3'),
      IcelandPopulation('Austur-H�ra�', 80599, 'Value 3'),
      IcelandPopulation('Nor�urland vestra', 39000, 'Value 4'),
      IcelandPopulation('Akureyri', 122897, 'Value 4'),
      IcelandPopulation('Su�urnes', 184135, 'Value 4'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gradient rage color mapper sample sample'),
      ),
      body: Directionality(
          textDirection: TextDirection.ltr,
          child: SfTreemap(
              dataCount: _population.length,
              weightValueMapper: (int index) =>
                  _population[index].population.toDouble(),
              colorMappers: [
                TreemapColorMapper.range(from: 0, to: 10, color: Colors.blue),
                TreemapColorMapper.range(from: 10, to: 20, color: Colors.green),
                TreemapColorMapper.range(
                    from: 20, to: 30, color: Colors.yellow),
                TreemapColorMapper.range(from: 30, to: 50, color: Colors.red),
              ],
              legend: TreemapLegend.bar(
                labelsPlacement: TreemapLegendLabelsPlacement.betweenItems,
                segmentPaintingStyle: TreemapLegendPaintingStyle.gradient,
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

class IcelandPopulation {
  const IcelandPopulation(this.key, this.population, this.value);

  final String key;

  final int population;

  final String value;
}
