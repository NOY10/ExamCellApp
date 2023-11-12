import 'package:examcellapp/views/Examcell/Dashboard/allStdResult.dart';
import 'package:flutter/material.dart';
import 'package:examcellapp/views/Examcell/Dashboard/AllStdResult.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    final String deptName = args?['deptName'] ?? 'No deptName';
    final String semester = args?['semester'] ?? 'No year';

    return Scaffold(
      appBar: AppBar(
        title: Text('Result View'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  deptName,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'Semester: $semester',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 20),
            resultTable(),
          ],
        ),
      ),
    );
  }
}
