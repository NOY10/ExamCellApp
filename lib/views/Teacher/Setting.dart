import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawerWidget(), //enable it if you want to have the drawer in the page
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 39, 121, 189),
      ),
    );
  }
}
