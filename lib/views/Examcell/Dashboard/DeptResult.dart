import 'package:flutter/material.dart';
import 'ModuleList.dart';

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

  final List<String> years = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
    '5th Year',
  ];

  final Map<String, Map<String, List<String>>> moduleData = {
    '1st Year': {
      'Architecture Department': [
        'Fundamentals of Architecture',
        'Mathematics',
        'Architectural Drawing',
        'Arts and Graphics',
        'Academic Skills',
        'Dzongkha for Communication'
      ],
      'Civil Engineering': [
        'Calculus and Infinite Series',
        'Introduction to Programming',
        'Engineering Physics',
        'Engineering Chemistry',
        'Engineering Graphics'
      ],
      'Electronics & Communication Engineering': [
        'Dzongkha for Communication',
        'Calculus and Infinite Series',
        'Engineering Physics',
        'Engineering Chemistry',
        'Engineering Graphics',
        'Academic Skills',
      ],
      'Electrical Engineering': [
        'Dzongkha for Communication',
        'Calculus and Infinite Series',
        'Engineering Physics',
        'Engineering Chemistry',
        'Engineering Graphics',
        'Academic Skills',
      ],
      'Information Technology': [
        'Computer Organization & Architecture',
        'Calculus and Infinite Series',
        'Engineering Physics',
        'Academic Skills',
        'Introduction to Programming'
      ],
      'Instrumentation and Control Engineering': [
        'Dzongkha for Communication',
        'Calculus and Infinite Series',
        'Engineering Physics',
        'Engineering Chemistry',
        'Engineering Graphics',
        'Academic Skills',
      ],
    },
    '2nd Year': {
      'Architecture Department': ['b', 'b', 'b'],
      'Civil Engineering': ['Module X', 'Module Y', 'Module Z'],
      'Electronics & Communication Engineering': [
        'Module X',
        'Module Y',
        'Module Z'
      ],
      'Electrical Engineering': ['Module X', 'Module Y', 'Module Z'],
      'Information Technology': [
        'Database Management Systems',
        'Environmental Science',
        'Operating Systems',
        'Internet Technologies & Web Engineering',
        'Computer Communication Networks'
      ],
      'Instrumentation and Control Engineering': [
        'Module X',
        'Module Y',
        'Module Z'
      ],
    },
    '3rd Year': {
      'Architecture Department': ['c', 'c', 'c'],
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
    },
    '4th Year': {
      'Architecture Department': ['d', 'd', 'd'],
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
    },
    '5th Year': {
      'Architecture Department': ['b', 'b', 'b'],
    },
  };

  final Map<String, Map<String, List<String>>> moduleCodeData = {
    '1st Year': {
      'Architecture Department': [
        'THD101',
        'MAT103',
        'AGR101',
        'AGR102',
        'ACS101',
        'DZG101'
      ],
      'Civil Engineering': ['MAT101', 'CPL101', 'PHY101', 'CHE101', 'EGP1010'],
      'Electronics & Communication Engineering': [
        'DZG101',
        'MAT101',
        'PHY101',
        'CHE101',
        'EGP101',
        'ACS101'
      ],
      'Electrical Engineering': [
        'DZG101',
        'MAT101',
        'PHY101',
        'CHE101',
        'EGP101',
        'ACS101'
      ],
      'Information Technology': [
        'CTE101',
        'MAT101',
        'PHY101',
        'ASC101',
        'CPL101'
      ],
      'Instrumentation and Control Engineering': [
        'DZG101',
        'MAT101',
        'PHY101',
        'CHE101',
        'EGP101',
        'ACS101'
      ],
    },
    '2nd Year': {
      'Architecture Department': ['2', '2', '2'],
      'Civil Engineering': ['CE101', 'CE201', 'CE301'],
      'Electronics & Communication Engineering': ['ECE101', 'ECE201', 'ECE301'],
      'Electrical Engineering': ['EE101', 'EE201', 'EE301'],
      'Information Technology': [
        'DIS201',
        'EVS201',
        'CTE203',
        'CTE204',
        'NWC201'
      ],
      'Instrumentation and Control Engineering': ['ICE101', 'ICE201', 'ICE301'],
    },
    '3rd Year': {
      'Architecture Department': ['3', '3', '3'],
      'Civil Engineering': ['CE101', 'CE201', 'CE301'],
      'Electronics & Communication Engineering': ['ECE101', 'ECE201', 'ECE301'],
      'Electrical Engineering': ['EE101', 'EE201', 'EE301'],
      'Information Technology': ['IT101', 'IT201', 'IT301'],
      'Instrumentation and Control Engineering': ['ICE101', 'ICE201', 'ICE301'],
    },
    '4th Year': {
      'Architecture Department': ['4', '4', '4'],
      'Civil Engineering': ['CE101', 'CE201', 'CE301'],
      'Electronics & Communication Engineering': ['ECE101', 'ECE201', 'ECE301'],
      'Electrical Engineering': ['EE101', 'EE201', 'EE301'],
      'Information Technology': ['IT101', 'IT201', 'IT301'],
      'Instrumentation and Control Engineering': ['ICE101', 'ICE201', 'ICE301'],
    },
    '5th Year': {
      'Architecture Department': ['2', '2', '2'],
    },
  };

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width / years.length;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: years.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onYearTap(index),
                  child: Container(
                    width: buttonWidth,
                    height: 50,
                    color: index == _currentIndex
                        ? Colors.white
                        : const Color.fromARGB(255, 85, 166, 232),
                    alignment: Alignment.center,
                    child: Text(
                      years[index],
                      style: const TextStyle(
                        color: Colors.black,
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
              children: List.generate(years.length, (index) {
                final year = years[index];
                return Center(
                  child: YearDepartments(
                    deptList: moduleData[year]?.keys.toList() ?? [],
                    semester: ((index + 1) * 2).toString(),
                    moduleData: moduleData[year] ?? {},
                    moduleCodeData: moduleCodeData[year] ?? {},
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
  final String semester;
  final Map<String, List<String>> moduleData;
  final Map<String, List<String>> moduleCodeData;

  YearDepartments({
    required this.deptList,
    required this.semester,
    required this.moduleData,
    required this.moduleCodeData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: deptList.map((deptName) {
          final modules = moduleData[deptName];
          final moduleCodes = moduleCodeData[deptName];

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
                  if (modules != null && moduleCodes != null)
                    ModuleList(
                      moduleList: modules,
                      moduleCodeList: moduleCodes,
                      deptNames: deptName,
                      semester: semester,
                    ),
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
