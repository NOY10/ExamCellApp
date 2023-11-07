import 'package:examcellapp/views/Examcell/Dashboard/Announcement.dart';
import 'package:examcellapp/views/Examcell/Dashboard/DeptResult.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // Expanded(
          //   flex: 1,
          //   child: AnnouncementMain(),
          // ),
          Expanded(
            child: DeptResult(),
          ),
        ],
      ),
    );
  }
}
