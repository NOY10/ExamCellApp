import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ModuleResult extends StatelessWidget {
  final String semester;
  final String tid;

  const ModuleResult({
    required this.semester,
    required this.tid,
    Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawerWidget(), //enable it if you want to have the drawer in the page
      appBar: AppBar(
        title: Text('Module Result'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Text(tid),
    );
  }
}
