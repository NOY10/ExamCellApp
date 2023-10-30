import 'package:examcellapp/views/Student/semesterList.dart';
import 'package:examcellapp/views/Student/stdResultView/stdResultView.dart';
import 'package:flutter/material.dart';
import 'package:examcellapp/views/Student/stdResultView/stdInfo.dart';

class StudentResult extends StatelessWidget {
  const StudentResult({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ResultHeader(),
          ),
          Divider(
            color: Colors.blue,
            thickness: 1,
            indent: 1,
          ),
          Expanded(
            flex: 4,
            child: semesterResult(),
          ),
        ],
      ),
    );
  }
}

class ResultHeader extends StatelessWidget {
  const ResultHeader({Key? key}) : super(key: key);
  final TEXT_COLOR = const Color(0xFF1A1717);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          //flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // RUB photo
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/RUB_logo.png'),
                    ),
                    SizedBox(width: 12),
                    // Text
                    Container(
                      width: 172,
                      child: Column(
                        children: [
                          Text(
                            'College of Science and Technology',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: TEXT_COLOR,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'ཚན་རིག་དང་འཕྲུལ་རིག་མཐོ་རིམ་སློབ་གྲྭ།',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: TEXT_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    // CST photo
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/CST_logo.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // const Divider(
        //   color: Colors.blue,
        //   thickness: 1,
        //   indent: 1,
        // ),
        // Expanded(
        //   flex: 1,
        //   child: StdInfo(),
        // )
      ],
    );
  }
}

// StdInfo(),