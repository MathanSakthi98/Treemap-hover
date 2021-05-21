import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class SquarifiedSelectionSample extends StatefulWidget {
  @override
  _SquarifiedSelectionSampleState createState() =>
      _SquarifiedSelectionSampleState();
}

class _SquarifiedSelectionSampleState extends State<SquarifiedSelectionSample> {
  late List<JobVacancyModel> _source;

  @override
  void initState() {
    _source = <JobVacancyModel>[
      JobVacancyModel(country: 'America', job: 'Sales', vacancy: 70),
      JobVacancyModel(
          country: 'America', job: 'Technical', group: 'Testers', vacancy: 35),
      JobVacancyModel(
          country: 'America',
          job: 'Technical',
          group: 'Developers',
          role: 'Windows',
          vacancy: 105),
      JobVacancyModel(
          country: 'America',
          job: 'Technical',
          group: 'Developers',
          role: 'Web',
          vacancy: 40),
      JobVacancyModel(country: 'America', job: 'Management', vacancy: 40),
      JobVacancyModel(country: 'America', job: 'Accounts', vacancy: 60),
      JobVacancyModel(
          country: 'India', job: 'Technical', group: 'Testers', vacancy: 25),
      JobVacancyModel(
          country: 'India',
          job: 'Technical',
          group: 'Developers',
          role: 'Windows',
          vacancy: 155),
      JobVacancyModel(
          country: 'India',
          job: 'Technical',
          group: 'Developers',
          role: 'Web',
          vacancy: 60),
      JobVacancyModel(
          country: 'Germany', job: 'Sales', group: 'Executive', vacancy: 30),
      JobVacancyModel(
          country: 'Germany', job: 'Sales', group: 'Analyst', vacancy: 40),
      JobVacancyModel(
          country: 'UK',
          job: 'Technical',
          group: 'Developers',
          role: 'Windows',
          vacancy: 100),
      JobVacancyModel(
          country: 'UK',
          job: 'Technical',
          group: 'Developers',
          role: 'Web',
          vacancy: 30),
      JobVacancyModel(country: 'UK', job: 'HR Executives', vacancy: 60),
      JobVacancyModel(country: 'UK', job: 'Marketing', vacancy: 40),
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
        title: Text('Squarified Selection'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: SfTreemap(
                dataCount: _source.length,
                weightValueMapper: (int index) {
                  return _source[index].vacancy;
                },
                onSelectionChanged: (TreemapTile tile) {},
                selectionSettings: const TreemapSelectionSettings(
                  color: Colors.purple,
                  border: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                levels: [
                  TreemapLevel(
                    color: Colors.pink,
                    padding: EdgeInsets.all(2.5),
                    groupMapper: (int index) => _source[index].country,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                          child: Text(
                        'Country : ${tile.group}\nVacancy: ${tile.weight}',
                      ));
                    },
                  ),
                  TreemapLevel(
                    color: Colors.lime,
                    padding: EdgeInsets.all(10.0),
                    groupMapper: (int index) => _source[index].job,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                        child: Text(
                          'Job : ${tile.group}',
                        ),
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Colors.blue,
                    padding: EdgeInsets.all(15.0),
                    groupMapper: (int index) {
                      return _source[index].group;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                          child: Text(
                        'Group : ${tile.group}',
                      ));
                    },
                  ),
                  TreemapLevel(
                    color: Colors.green,
                    padding: EdgeInsets.all(15.0),
                    groupMapper: (int index) {
                      return _source[index].role;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return IgnorePointer(
                        child: Text(
                          'Role : ${tile.group}',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.build),
            label: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Rebuild'),
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
