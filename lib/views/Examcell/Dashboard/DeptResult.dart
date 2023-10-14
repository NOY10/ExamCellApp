import 'package:flutter/material.dart';

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
  ];

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
                  child: YearDepartments(deptList: dept),
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
  YearDepartments({required this.deptList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: deptList.map((deptName) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
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
            child: Department(deptName: deptName),
          ),
        );
      }).toList(),
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
            width: MediaQuery.of(context).size.width / 6,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            alignment: Alignment.center,
            child: Text(
              deptName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
