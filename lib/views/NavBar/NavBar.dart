import 'package:flutter/material.dart';
import 'package:examcellapp/views/Teacher/Setting.dart';
import 'package:examcellapp/views/Teacher/About.dart';
import 'package:examcellapp/views/Teacher/userpage.dart';
import 'package:examcellapp/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late SharedPreferences prefs;
  String name = '';
  String email = '';
  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    loadSharedPreferences();
  }

  Future<void> loadSharedPreferences() async {
    if (!dataLoaded) {
      final String? userID = prefs.getString('userID');
      final Uri url =
          Uri.parse("https://examcellflutter.000webhostapp.com/NavInfo.php");

      final response = await http.post(url, body: {
        "userID": userID,
      });

      var data = json.decode(response.body);
      setState(() {
        name = data['name'];
        email = data['email'];
        dataLoaded = true;
      });
    }
  }

  final padding = EdgeInsets.symmetric(horizontal: 20);

  final urlImage =
      'https://unsplash.com/photos/Kt8eGw8_S8Y/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NXx8YW5pbWF0ZWQlMjBtYW58ZW58MHx8fHwxNjk2OTUzNTU5fDA&force=true';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white, // Set the background color to white
        ),
        child: Material(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserPage(
                    name: name,
                    urlImage: urlImage,
                  ),
                )),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Dark Mode',
                icon: Icons.dark_mode_outlined,
              ),
              const SizedBox(height: 5),
              buildMenuItem(
                text: 'About',
                icon: Icons.info_outline_rounded,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 5),
              buildMenuItem(
                text: 'Setting',
                icon: Icons.settings_outlined,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Help',
                icon: Icons.help_outline,
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: Colors.black,
                  height: 5,
                ),
              ),
              const SizedBox(height: 5),
              buildMenuItem(
                text: 'Log Out',
                icon: Icons.logout,
                onClicked: () {
                  showLogoutConfirmationDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding: padding.add(EdgeInsets.symmetric(vertical: 30)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(urlImage),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      leading: Icon(
        icon,
        color: Colors.black,
        size: 27,
      ),
      title: Row(
        children: [
          SizedBox(width: 15.0),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.5,
            ),
          ),
        ],
      ),
      hoverColor: Colors.white70,
      onTap: () {
        onClicked?.call();
      },
    );
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Clear data from SharedPreferences
                prefs.remove('userID');
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text('Log Out'),
            ),
          ],
        );
      },
    );
  }

  void selectedItem(BuildContext context, int index) {
    // Handle navigation based on the selected item (if needed).
  }
}
