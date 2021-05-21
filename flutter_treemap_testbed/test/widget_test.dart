// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final List<TreemapModel> _source = <TreemapModel>[
      TreemapModel('Asia', 'Thailand', 7.54),
      TreemapModel('Africa', 'South Africa', 25.4),
      TreemapModel('North America', 'Canada', 13.3),
      TreemapModel('South America', 'Chile', 19.11),
      TreemapModel('Australia', 'New Zealand', 4.93),
      TreemapModel('Europe', 'Czech Republic', 10.65),
    ];

    final List<TreemapLevel> treemapLevel = <TreemapLevel>[
      TreemapLevel(
        groupMapper: (int index) {
          return _source[index].continent;
        },
        color: Colors.red,
      )
    ];

    // Build our app and trigger a frame.
    await tester.pumpWidget(SfTreemap.slice(
      dataCount: _source.length,
      weightValueMapper: (int index) {
        return _source[index].populationInMillions;
      },
      levels: treemapLevel,
    ));

    // Verify that our counter starts at 0.
    expect(_source.length, equals(6));
    expect(treemapLevel.length, equals(1));
  });
}

class TreemapModel {
  const TreemapModel(this.continent, this.country, this.populationInMillions);

  final String country;
  final String continent;
  final double populationInMillions;
}
