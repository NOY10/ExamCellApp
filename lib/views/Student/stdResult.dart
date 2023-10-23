import 'package:examcellapp/views/Student/stdResultView.dart';
import 'package:flutter/material.dart';

class StudentResult extends StatelessWidget {
  const StudentResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ResultHeader(),
          ),
          Expanded(
            flex: 3,
            child: StudentResultView(),
          ),
        ],
      ),
    );
  }
}

class ResultHeader extends StatelessWidget {
  const ResultHeader({Key? key}) : super(key: key);
  final TEXT_COLOR = 0xFF1A1717;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0), // space from the top
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(top: 5.0), // space from the top
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // RUB photo
                Container(
                  width: 80,
                  height: 80,
                  child: Image.asset('assets/images/RUB_logo.png'),
                ),
                SizedBox(width: 20), // space between the elements
                // Text
                Container(
                  width: 190,
                  child: Center(
                    // Center the content horizontally
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center the content vertically
                      children: [
                        Text(
                          'College of Science and Technology',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(TEXT_COLOR),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ཚན་རིག་དང་འཕྲུལ་རིག་མཐོ་རིམ་སློབ་གྲྭ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(TEXT_COLOR),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // CST photo
                Container(
                  width: 80,
                  height: 80,
                  child: Image.asset('assets/images/CST_logo.png'),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.blue,
            thickness: 2,
            indent: 1,
          ),
        ],
      ),
    );
  }
}

class ResultTable extends StatelessWidget {
  const ResultTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
