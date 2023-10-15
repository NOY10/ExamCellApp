import 'package:flutter/material.dart';
import 'package:examcellapp/views/Examcell/Dashboard/ModuleList.dart';

class DeptResult extends StatefulWidget {
  const DeptResult({Key? key}) : super(key: key);

  @override
  _DeptResultState createState() => _DeptResultState();
}

class _DeptResultState extends State<DeptResult> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onYearTap(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  final List<String> Years = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
    '5th Year'
  ];
  final List<String> dept = [
    'Architecture Department',
    'Civil Engineering',
    'Electronics & Communication Engineering',
    'Electrical Engineering',
    'Information Technology',
    'Instrumentation and Control Engineering',
  ];

  final Map<String, List<String>> moduleData = {
    'Architecture Department': ['Module A', 'Module B', 'Module C'],
    'Civil Engineering': ['Module X', 'Module Y', 'Module Z'],
    'Electronics & Communication Engineering': [
      'Module X',
      'Module Y',
      'Module Z'
    ],
    'Electrical Engineering': ['Module X', 'Module Y', 'Module Z'],
    'Information Technology': ['Module X', 'Module Y', 'Module Z'],
    'Instrumentation and Control Engineering': [
      'Module X',
      'Module Y',
      'Module Z'
    ],
  };

  final Map<String, List<String>> moduleCodeData = {
    'Architecture Department': ['CTE101', 'CTE201', 'CTE301'],
    'Civil Engineering': ['CE101', 'CE201', 'CE301'],
    'Electronics & Communication Engineering': ['ECE101', 'ECE201', 'ECE301'],
    'Electrical Engineering': ['EE101', 'EE201', 'EE301'],
    'Information Technology': ['IT101', 'IT201', 'IT301'],
    'Instrumentation and Control Engineering': ['ICE101', 'ICE201', 'ICE301'],
  };

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width / Years.length;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Years.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onYearTap(index),
                  child: Container(
                    width: buttonWidth,
                    height: 50,
                    color: index == _currentIndex ? Colors.blue : Colors.grey,
                    alignment: Alignment.center,
                    child: Text(
                      Years[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: List.generate(Years.length, (index) {
                return Center(
                  child: YearDepartments(
                    deptList: dept,
                    year: (index + 1).toString(),
                    moduleData: moduleData,
                    moduleCodeData: moduleCodeData,
                  ),
                );
              }),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class YearDepartments extends StatelessWidget {
  final List<String> deptList;
  final String year;
  final Map<String, List<String>> moduleData;
  final Map<String, List<String>> moduleCodeData;

  YearDepartments({
    required this.deptList,
    required this.year,
    required this.moduleData,
    required this.moduleCodeData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: deptList.map((deptName) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ExpansionTile(
                title: Department(deptName: deptName),
                children: [
                  ModuleList(
                      moduleList: moduleData[deptName] ?? [],
                      moduleCodeList: moduleCodeData[deptName] ?? [],
                      deptNames: deptName,
                      year: year),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Department extends StatelessWidget {
  final String deptName;
  Department({required this.deptName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width / 7,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    deptName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
