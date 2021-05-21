//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class SampleDataSource extends StatefulWidget {
  const SampleDataSource({Key? key}) : super(key: key);

  @override
  _SampleDataSourceState createState() => _SampleDataSourceState();
}

class _SampleDataSourceState extends State<SampleDataSource> {
  late List<TreemapModel> _source;

  @override
  void initState() {
    super.initState();
    // Sample source: https://help.syncfusion.com/uwp/sunburst-chart/getting-started
    _source = <TreemapModel>[
      TreemapModel(country: 'America', field: 'Sales', vacancy: 70),
      TreemapModel(
          country: 'Russia', field: 'Technical', job: 'Testers', vacancy: 35),
      TreemapModel(
          country: 'America',
          field: 'Technical',
          job: 'Developers',
          role: 'Windows',
          vacancy: 105),
      TreemapModel(
          country: 'Africa',
          field: 'Technical',
          job: 'Developers',
          role: 'Web',
          vacancy: 40),
      TreemapModel(country: 'America', field: 'Management', vacancy: 40),
      TreemapModel(country: 'America', field: 'Accounts', vacancy: 60),
      TreemapModel(
          country: 'India', field: 'Technical', job: 'Testers', vacancy: 25),
      TreemapModel(
          country: 'India',
          field: 'Technical',
          job: 'Developers',
          role: 'Windows',
          vacancy: 155),
      TreemapModel(
          country: 'India',
          field: 'Technical',
          job: 'Developers',
          role: 'Web',
          vacancy: 60),
      TreemapModel(
          country: 'Germany', field: 'Sales', job: 'Executive', vacancy: 30),
      TreemapModel(
          country: 'Germany', field: 'Sales', job: 'Analyst', vacancy: 40),
      TreemapModel(
          country: 'France',
          field: 'Technical',
          job: 'Developers',
          role: 'Windows',
          vacancy: 100),
      TreemapModel(
          country: 'UK',
          field: 'Technical',
          job: 'Developers',
          role: 'Web',
          vacancy: 30),
      TreemapModel(country: 'UK', field: 'HR Executives', vacancy: 60),
      TreemapModel(country: 'Italy', field: 'Marketing', vacancy: 40),
    ];
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
        title: Text('Sample Datasource'),
      ),
      body: SfTreemap(
        dataCount: _source.length,
        weightValueMapper: (int index) {
          return _source[index].vacancy;
        },
        levels: [
          TreemapLevel(groupMapper: (int index) {
            return _source[index].country;
          }),
          TreemapLevel(groupMapper: (int index) {
            return _source[index].field!;
          }),
          TreemapLevel(groupMapper: (int index) {
            return _source[index].job!;
          }),
          TreemapLevel(groupMapper: (int index) {
            return _source[index].role!;
          }),
        ],
        legend: TreemapLegend(
          position: TreemapLegendPosition.top,
          overflowMode: TreemapLegendOverflowMode.scroll,
        ),
      ),
    );
  }
}

class TreemapModel {
  const TreemapModel(
      {required this.country,
      this.field,
      this.job,
      this.role,
      required this.vacancy});
  final String country;
  final String? field;
  final String? job;
  final String? role;
  final double vacancy;
}
