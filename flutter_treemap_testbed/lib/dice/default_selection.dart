import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class DefaultSelectionSample extends StatefulWidget {
  @override
  _DefaultSelectionSampleState createState() => _DefaultSelectionSampleState();
}

class _DefaultSelectionSampleState extends State<DefaultSelectionSample> {
  late List<JobVacancyModel> _source;

  @override
  void initState() {
    _source = <JobVacancyModel>[
      JobVacancyModel(country: 'America', job: 'Sales', vacancy: 20),
      JobVacancyModel(
          country: 'America',
          job: 'Technical',
          group: 'Developers',
          vacancy: 35),
      JobVacancyModel(
          country: 'America',
          job: 'Technical',
          group: 'Developers',
          role: 'Windows',
          vacancy: 75),
      JobVacancyModel(
          country: 'America',
          job: 'Technical',
          group: 'Developers',
          role: 'Web',
          vacancy: 10),
      JobVacancyModel(country: 'America', job: 'Management', vacancy: 30),
      JobVacancyModel(country: 'America', job: 'Accounts', vacancy: 60),
      JobVacancyModel(
          country: 'India', job: 'Technical', group: 'Testers', vacancy: 75),
      JobVacancyModel(
          country: 'India',
          job: 'Technical',
          group: 'Developers',
          role: 'Windows',
          vacancy: 55),
      JobVacancyModel(
          country: 'India',
          job: 'Technical',
          group: 'Developers',
          role: 'Web',
          vacancy: 60),
      JobVacancyModel(
          country: 'Germany', job: 'Sales', group: 'Executive', vacancy: 30),
      JobVacancyModel(
          country: 'Germany', job: 'Sales', group: 'Analyst', vacancy: 50),
      JobVacancyModel(
          country: 'UK',
          job: 'Technical',
          group: 'Developers',
          role: 'Windows',
          vacancy: 10),
      JobVacancyModel(
          country: 'UK',
          job: 'Technical',
          group: 'Developers',
          role: 'Web',
          vacancy: 30),
      JobVacancyModel(country: 'UK', job: 'HR Executives', vacancy: 60),
      JobVacancyModel(country: 'UK', job: 'Marketing', vacancy: 20),
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
        title: Text('Slice Default Selection'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: SfTreemap.dice(
                dataCount: _source.length,
                weightValueMapper: (int index) {
                  return _source[index].vacancy;
                },
                onSelectionChanged: (TreemapTile tile) {},
                levels: [
                  TreemapLevel(
                    color: Color.fromRGBO(78, 198, 125, 1),
                    padding: EdgeInsets.all(2.5),
                    groupMapper: (int index) => _source[index].country,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                        child: Text(
                          'Country ${tile.group}',
                        ),
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Color.fromRGBO(236, 105, 85, 1),
                    padding: EdgeInsets.all(10.0),
                    groupMapper: (int index) => _source[index].job,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                        child: Text(
                          'Job: ${tile.group}',
                        ),
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Colors.indigo,
                    padding: EdgeInsets.all(15.0),
                    groupMapper: (int index) {
                      return _source[index].group;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                        child: Text(
                          'Group : ${tile.group}',
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

class JobVacancyModel {
  const JobVacancyModel(
      {required this.country,
      this.job,
      this.group,
      this.role,
      required this.vacancy});
  final String country;
  final String? job;
  final String? group;
  final String? role;
  final double vacancy;
}
