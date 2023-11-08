import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Tutor Page',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify, // Justify the text
                    ),
                    SizedBox(height: 10),
                    Text(
                      'In this page only the tutor will be able to login with their required credentials. The tutor will be able to view his profile, upload the result and view the result.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify, // Justify the text
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Student Page',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify, // Justify the text
                    ),
                    SizedBox(height: 10),
                    Text(
                      'In this page the students will be able to access their results. They will also be able to view their profiles.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify, // Justify the text
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Exam Cell Page',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify, // Justify the text
                    ),
                    SizedBox(height: 10),
                    Text(
                      'In this page the exam cell will able Update the student records and also they will be able to declare the results after the compilation of the results.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify, // Justify the text
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
