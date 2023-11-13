import 'package:examcellapp/views/Examcell/Dashboard/ResultView.dart';
import 'package:examcellapp/views/Examcell/Dashboard/allStdResult.dart';
import 'package:flutter/material.dart';
// import 'ModuleResultPage.dart';

class ModuleList extends StatelessWidget {
  final List<String> moduleList;
  final List<String> moduleCodeList;
  final String deptNames;
  final String semester;

  ModuleList(
      {required this.moduleList,
      required this.moduleCodeList,
      required this.deptNames,
      required this.semester});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(moduleList.length, (index) {
        final moduleName = moduleList[index];
        final moduleCode = moduleCodeList[index];
        final deptName = deptNames;
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            margin: EdgeInsets.only(left: 40),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .start, // Align module name and code to the left
              children: [
                Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(
                      5.0), // Padding between name and code
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Text(
                        moduleName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        moduleCode,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(), // Adds space between text and the arrow
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/moduleResultPage',
                      arguments: {
                        'moduleName': moduleName,
                        'moduleCode': moduleCode,
                        'deptName': deptName,
                        'semester': semester,
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: Icon(Icons.arrow_forward, color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
        );
      })
        ..add(
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              margin: EdgeInsets.only(left: 40),
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                color: Colors.white,
              ),
              child: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   '/ResultView',
                  //   arguments: {
                  //     'deptName': deptNames,
                  //     'semester': semester,
                  //   },
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultView()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 0),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue, // Set the background to blue
                  ),
                  child: Center(
                    child: Text(
                      "View Result",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
