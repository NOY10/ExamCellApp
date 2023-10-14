import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const SizedBox(
          height: 65,
          width: double.infinity,
          child: DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Student Result System',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          dense: true, // Reduce ListTile height
          leading: Icon(Icons.dark_mode_outlined),
          title: Text(
            "Dark Mode",
            style: TextStyle(fontSize: 14.0),
          ),
          onTap: () => null,
        ),
        const Divider(),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          dense: true,
          leading: Icon(Icons.info_outline_rounded),
          title: Text(
            "About",
            style: TextStyle(fontSize: 14.0),
          ),
          onTap: () => null,
        ),
        const Divider(),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          dense: true,
          leading: Icon(Icons.help_outline),
          title: Text(
            "Help",
            style: TextStyle(fontSize: 14.0),
          ),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          dense: true,
          leading: Icon(Icons.settings_outlined),
          title: Text(
            "Setting",
            style: TextStyle(fontSize: 14.0),
          ),
          onTap: () => null,
        ),
        const Divider(),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          dense: true,
          leading: Icon(Icons.logout),
          title: Text(
            "Log Out",
            style: TextStyle(fontSize: 14.0),
          ),
          onTap: () => null,
        ),
        const Divider(),
      ]),
    );
  }
}
