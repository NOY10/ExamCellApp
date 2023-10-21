import 'package:flutter/material.dart';

class StudentResult extends StatelessWidget {
  const StudentResult({super.key});

  final FONT_SIZE = 12;
  final TEXT_COLOR = 0xFF1A1717;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 39, 121, 189),
      ),
      body: Container(
        
      ),
    );
  }
}