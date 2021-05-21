import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class TabViewSample extends StatefulWidget {
  @override
  _TabViewSampleState createState() => _TabViewSampleState();
}

class _TabViewSampleState extends State<TabViewSample> {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Treemap with tab view'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.arrow_back)),
                Tab(icon: Icon(Icons.arrow_forward)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SfTreemap.dice(
                dataCount: _source.length,
                weightValueMapper: (int index) {
                  return _source[index].vacancy;
                },
                levels: [
                  TreemapLevel(
                    color: Color.fromARGB(205, 158, 57, 118),
                    border: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    groupMapper: (int index) => _source[index].country,
                  ),
                  TreemapLevel(
                    color: Color.fromARGB(255, 226, 136, 99),
                    border: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    groupMapper: (int index) => _source[index].job!,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return Text(
                        '${tile.group} \n vacancy : ${tile.weight}',
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Color.fromARGB(255, 237, 194, 136),
                    border: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    groupMapper: (int index) {
                      return _source[index].group;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return Text(
                        '${tile.group} \n vacancy : ${tile.weight}',
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Color.fromARGB(255, 252, 253, 193),
                    padding: EdgeInsets.all(5.0),
                    border: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    groupMapper: (int index) {
                      return _source[index].role;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return Text(
                        '${tile.group} \n vacancy : ${tile.weight}',
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ],
              ),
              SfTreemap.slice(
                dataCount: _source.length,
                weightValueMapper: (int index) {
                  return _source[index].vacancy;
                },
                levels: [
                  TreemapLevel(
                    color: Color.fromARGB(205, 158, 57, 118),
                    border: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    groupMapper: (int index) => _source[index].country,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return Text(
                        '${tile.group} \n vacancy : ${tile.weight}',
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Color.fromARGB(255, 226, 136, 99),
                    border: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    groupMapper: (int index) => _source[index].job,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return Text(
                        '${tile.group} \n vacancy : ${tile.weight}',
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Color.fromARGB(255, 237, 194, 136),
                    border: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    groupMapper: (int index) {
                      return _source[index].group;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return Text(
                        '${tile.group} \n vacancy : ${tile.weight}',
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  TreemapLevel(
                    color: Color.fromARGB(255, 252, 253, 193),
                    padding: EdgeInsets.all(5.0),
                    border: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    groupMapper: (int index) {
                      return _source[index].role;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return Text(
                        '${tile.group} \n vacancy : ${tile.weight}',
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
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
