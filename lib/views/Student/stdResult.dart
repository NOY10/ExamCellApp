import 'package:flutter/material.dart';

class StudentResult extends StatelessWidget {
  const StudentResult({super.key});

  final TEXT_COLOR = 0xFF1A1717;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16), // space at the top of the Column

          // First Row with a photo, text, and another photo
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
                SizedBox(width: 40), // space between the elements
                // Text
                Container(
                  width: 140,
                  child: Column(
                    children: [
                      Text(
                        'College of Science and Technology',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(TEXT_COLOR),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'ཚན་རག་དང་འཕྲུལ་རིག་མཐོ་རིམ་སློབ་གྲྭ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(TEXT_COLOR),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 40),
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
