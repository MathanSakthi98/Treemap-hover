import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class UpdateTooltipDynamicallySample extends StatefulWidget {
  @override
  _UpdateTooltipDynamicallySampleState createState() =>
      _UpdateTooltipDynamicallySampleState();
}

class _UpdateTooltipDynamicallySampleState
    extends State<UpdateTooltipDynamicallySample> {
  late List<USElectionDataModel> _electionSource;
  late List<TreemapColorMapper> _colorMappers;
  bool _canUpdateTooltipBuilder = false;

  @override
  void initState() {
    _electionSource = <USElectionDataModel>[
      USElectionDataModel(
          state: 'Washington',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 4087631,
          votes: 2369612,
          percentage: 57.97),
      USElectionDataModel(
          state: 'Oregon',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 2374321,
          votes: 1340383,
          percentage: 56.45),
      USElectionDataModel(
          state: 'Alabama',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 2323282,
          votes: 1441170,
          percentage: 62.03),
      USElectionDataModel(
          state: 'Alaska',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 359530,
          votes: 189951,
          percentage: 52.83),
      USElectionDataModel(
          state: 'Arizona',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 3387326,
          votes: 1672143,
          percentage: 49.36),
      USElectionDataModel(
          state: 'Arkansas',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 1219069,
          votes: 760647,
          percentage: 62.40),
      USElectionDataModel(
          state: 'California',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 17500881,
          votes: 11110250,
          percentage: 63.48),
      USElectionDataModel(
          state: 'Colorado',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 3256980,
          votes: 1804352,
          percentage: 55.40),
      USElectionDataModel(
          state: 'Connecticut',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 1823857,
          votes: 1080831,
          percentage: 59.26),
      USElectionDataModel(
          state: 'Delaware',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 504346,
          votes: 296268,
          percentage: 58.74),
      USElectionDataModel(
          state: 'District of Columbia',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 344356,
          votes: 317323,
          percentage: 92.15),
      USElectionDataModel(
          state: 'Florida',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 11067456,
          votes: 5668731,
          percentage: 51.22),
      USElectionDataModel(
          state: 'Georgia',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 4999960,
          votes: 2473633,
          percentage: 49.47),
      USElectionDataModel(
          state: 'Hawaii',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 574469,
          votes: 366130,
          percentage: 63.73),
      USElectionDataModel(
          state: 'Idaho',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 868014,
          votes: 554119,
          percentage: 63.84),
      USElectionDataModel(
          state: 'Illinois',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 6033744,
          votes: 3471915,
          percentage: 57.54),
      USElectionDataModel(
          state: 'Indiana',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 3033121,
          votes: 1729519,
          percentage: 57.02),
      USElectionDataModel(
          state: 'Iowa',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 1690871,
          votes: 897672,
          percentage: 53.09),
      USElectionDataModel(
          state: 'Kansas',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 1372303,
          votes: 771406,
          percentage: 56.21),
      USElectionDataModel(
          state: 'Kentucky',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 2136768,
          votes: 1326646,
          percentage: 62.09),
      USElectionDataModel(
          state: 'Louisiana',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 2148062,
          votes: 1255776,
          percentage: 58.46),
      USElectionDataModel(
          state: 'Maine-1',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 443112,
          votes: 266376,
          percentage: 60.11),
      USElectionDataModel(
          state: 'Maine-2',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 376349,
          votes: 196692,
          percentage: 52.26),
      USElectionDataModel(
          state: 'Maryland',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 3037030,
          votes: 1985023,
          percentage: 65.36),
      USElectionDataModel(
          state: 'Massachusetts',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 3631402,
          votes: 2382202,
          percentage: 65.60),
      USElectionDataModel(
          state: 'Michigan',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 5539302,
          votes: 2804040,
          percentage: 50.62),
      USElectionDataModel(
          state: 'Minnesota',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 3277171,
          votes: 1717077,
          percentage: 52.40),
      USElectionDataModel(
          state: 'Mississippi',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 1313759,
          votes: 756764,
          percentage: 57.60),
      USElectionDataModel(
          state: 'Missouri',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 3025962,
          votes: 1718736,
          percentage: 56.80),
      USElectionDataModel(
          state: 'Montana',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 603674,
          votes: 343602,
          percentage: 56.92),
      USElectionDataModel(
          state: 'Nebraska-1',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 321886,
          votes: 180290,
          percentage: 56.01),
      USElectionDataModel(
          state: 'Nebraska-2',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 339666,
          votes: 176468,
          percentage: 51.95),
      USElectionDataModel(
          state: 'Nebraska-3',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 294831,
          votes: 222179,
          percentage: 75.36),
      USElectionDataModel(
          state: 'Nevada',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 1405376,
          votes: 703486,
          percentage: 50.06),
      USElectionDataModel(
          state: 'New Hampshire',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 806205,
          votes: 424937,
          percentage: 52.71),
      USElectionDataModel(
          state: 'New Jersey',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 4549353,
          votes: 2608335,
          percentage: 57.33),
      USElectionDataModel(
          state: 'New Mexico',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 923965,
          votes: 501614,
          percentage: 54.29),
      USElectionDataModel(
          state: 'New York',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 8594826,
          votes: 5230985,
          percentage: 60.86),
      USElectionDataModel(
          state: 'North Carolina',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 5524804,
          votes: 2758775,
          percentage: 49.93),
      USElectionDataModel(
          state: 'North Dakota',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 361819,
          votes: 235595,
          percentage: 65.11),
      USElectionDataModel(
          state: 'Ohio',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 5922202,
          votes: 3154834,
          percentage: 53.27),
      USElectionDataModel(
          state: 'Oklahoma',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 1560699,
          votes: 1020280,
          percentage: 65.37),
      USElectionDataModel(
          state: 'Pennsylvania',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 6915283,
          votes: 3458229,
          percentage: 50.01),
      USElectionDataModel(
          state: 'Rhode Island',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 517757,
          votes: 307486,
          percentage: 59.39),
      USElectionDataModel(
          state: 'South Carolina',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 2513329,
          votes: 1385103,
          percentage: 55.11),
      USElectionDataModel(
          state: 'South Dakota',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 422609,
          votes: 261043,
          percentage: 61.77),
      USElectionDataModel(
          state: 'Tennessee',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 3053851,
          votes: 1852475,
          percentage: 60.66),
      USElectionDataModel(
          state: 'Texas',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 11315056,
          votes: 5890347,
          percentage: 52.06),
      USElectionDataModel(
          state: 'Utah',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 1488289,
          votes: 865140,
          percentage: 58.13),
      USElectionDataModel(
          state: 'Vermont',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 367428,
          votes: 242820,
          percentage: 66.09),
      USElectionDataModel(
          state: 'Virginia',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 4460524,
          votes: 2413568,
          percentage: 54.11),
      USElectionDataModel(
          state: 'West Virginia',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 794731,
          votes: 235984,
          percentage: 68.62),
      USElectionDataModel(
          state: 'Wisconsin',
          candidate: 'Joe Biden',
          party: 'Democratic',
          totalVoters: 3298041,
          votes: 1610184,
          percentage: 49.45),
      USElectionDataModel(
          state: 'Wyoming',
          candidate: 'Donald Trump',
          party: 'Republican',
          totalVoters: 276765,
          votes: 193559,
          percentage: 69.94),
    ];

    _colorMappers = <TreemapColorMapper>[
      TreemapColorMapper.range(
          from: 80,
          to: 100,
          color: Color.fromRGBO(0, 0, 81, 1.0),
          name: '{Democratic},{}'),
      TreemapColorMapper.range(
          from: 75, to: 80, color: Color.fromRGBO(0, 43, 132, 1.0), name: ''),
      TreemapColorMapper.range(
          from: 70, to: 75, color: Color.fromRGBO(6, 69, 180, 1.0), name: ''),
      TreemapColorMapper.range(
          from: 65, to: 70, color: Color.fromRGBO(22, 102, 203, 1.0), name: ''),
      TreemapColorMapper.range(
          from: 60, to: 65, color: Color.fromRGBO(67, 137, 227, 1.0), name: ''),
      TreemapColorMapper.range(
          from: 55, to: 60, color: Color.fromRGBO(80, 154, 242, 1.0), name: ''),
      TreemapColorMapper.range(
          from: 45,
          to: 55,
          color: Color.fromRGBO(134, 182, 242, 1.0),
          name: ''),
      TreemapColorMapper.range(
          from: -55,
          to: -45,
          color: Color.fromRGBO(255, 178, 178, 1.0),
          name: ''),
      TreemapColorMapper.range(
          from: -60,
          to: -55,
          color: Color.fromRGBO(255, 127, 127, 1.0),
          name: ''),
      TreemapColorMapper.range(
          from: -65,
          to: -60,
          color: Color.fromRGBO(255, 76, 76, 1.0),
          name: ''),
      TreemapColorMapper.range(
          from: -70, to: -65, color: Color.fromRGBO(255, 0, 0, 1.0), name: ''),
      TreemapColorMapper.range(
          from: -75, to: -70, color: Color.fromRGBO(178, 0, 0, 1.0), name: ''),
      TreemapColorMapper.range(
          from: -80, to: -75, color: Color.fromRGBO(127, 0, 0, 1.0), name: ''),
      TreemapColorMapper.range(
          from: -100,
          to: -80,
          color: Color.fromRGBO(102, 0, 0, 1.0),
          name: 'Republican'),
    ];

    super.initState();
  }

  @override
  void dispose() {
    _electionSource.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update tooltip dynamically'),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
                height: 40.0,
                child: DrawerHeader(
                    padding: const EdgeInsets.fromLTRB(20, 7, 0, 0),
                    margin: const EdgeInsets.all(0),
                    child: const Text('Tooltip properties',
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
                    title: const Text('Show tooltip builder'),
                    value: _canUpdateTooltipBuilder,
                    onChanged: (bool? value) {
                      setState(() {
                        _canUpdateTooltipBuilder = value!;
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: SfTreemap(
                dataCount: _electionSource.length,
                weightValueMapper: (int index) {
                  return _electionSource[index].totalVoters;
                },
                colorMappers: _colorMappers,
                tooltipSettings: TreemapTooltipSettings(
                  color: Colors.black,
                  borderColor: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                legend: TreemapLegend.bar(),
                levels: [
                  TreemapLevel(
                    border: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                    colorValueMapper: (TreemapTile tile) {
                      if (_electionSource[tile.indices[0]].candidate ==
                          'Joe Biden') {
                        return _electionSource[tile.indices[0]].percentage;
                      } else {
                        return -(_electionSource[tile.indices[0]].percentage!);
                      }
                    },
                    groupMapper: (int index) => _electionSource[index].state,
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                        child: Text(tile.group),
                      );
                    },
                    tooltipBuilder: (BuildContext context, TreemapTile tile) {
                      if (_canUpdateTooltipBuilder) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Won percentage: ${_electionSource[tile.indices[0]].percentage}',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      return null;
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

class USElectionDataModel {
  const USElectionDataModel(
      {required this.state,
      required this.totalVoters,
      this.party,
      this.candidate,
      this.votes,
      this.percentage});

  final String state;
  final double totalVoters;
  final String? party;
  final String? candidate;
  final double? votes;
  final double? percentage;
}
