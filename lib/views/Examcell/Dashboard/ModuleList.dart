import 'package:flutter/material.dart';

class ModuleList extends StatelessWidget {
  final List<String> moduleList;
  final List<String> moduleCodeList;

  ModuleList({
    required this.moduleList,
    required this.moduleCodeList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(moduleList.length, (index) {
        final moduleName = moduleList[index];
        final moduleCode = moduleCodeList[index];
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
                          fontSize: 10,
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
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(), // Adds space between text and the arrow
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/moduleDetails', arguments: {
                      'moduleName': moduleName,
                      'moduleCode': moduleCode,
                    });
                  },
                  child: Icon(Icons.arrow_forward, color: Colors.blue),
                ),
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
                color: Colors.blue,
              ),
              child: GestureDetector(
                onTap: () {
                  print("reu"); // Navigate to the result page
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
