import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawerWidget(), //enable it if you want to have the drawer in the page
      appBar: AppBar(
        title: Text('Help'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
