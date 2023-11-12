import 'package:examcellapp/views/Examcell/Dashboard/Announcement.dart';
import 'package:examcellapp/views/Examcell/Dashboard/DeptResult.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 800,
              child: DeptResult(),
            ),
          ],
        ),
      ),
    );
  }

}
